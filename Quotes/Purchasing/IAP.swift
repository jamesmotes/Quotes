//
//  IAP.swift
//  Quotes
//
//  Created by James Motes on 1/24/18.
//  Copyright © 2018 JDM. All rights reserved.
//


/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 */

import Foundation
import StoreKit


var SECRET = "142c41b9e7384d469f2b7cbb1f836e53"


class PurchasesController: NSObject {
    
    static let sessionIdSetNotification = Notification.Name("SessionIdSetNotification")
    static let optionsLoadedNotification = Notification.Name("OptionsLoadedNotification")
    static let restoreSuccessfulNotification = Notification.Name("RestoreSuccessfulNotification")
    static let purchaseSuccessfulNotification = Notification.Name("PurchaseSuccessfulNotification")

    
    static let shared = PurchasesController()
    
    
    var hasReceiptData: Bool {
        return loadReceipt() != nil
    }
    
    var currentSessionId: String? {
        didSet {
            NotificationCenter.default.post(name: PurchasesController.sessionIdSetNotification, object: currentSessionId)
        }
    }
    
    
    var currentSubscription: PaidSubscription?
    
    var options: [Subscription]? {
        didSet {
            NotificationCenter.default.post(name: PurchasesController.optionsLoadedNotification, object: options)
        }
    }
    
    func loadSubscriptionOptions() {
        let monthlyAccess = "feature_access"
        let lifetimeAccess = "lifetime_access"
        
        let productIDs = Set([monthlyAccess, lifetimeAccess])
        
        let request = SKProductsRequest(productIdentifiers: productIDs)
        request.delegate = self
        request.start()
    }
    
    func purchase(subscription: Subscription) {
        let payment = SKPayment(product: subscription.product)
        SKPaymentQueue.default().add(payment)
    }
    
    func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    func uploadReceipt(completion: ((_ success: Bool) -> Void)? = nil) {
        if let receiptData = loadReceipt() {
            SessionHandler.shared.upload(receipt: receiptData) { [weak self] (result) in
                guard let strongSelf = self else { return }
                switch result {
                case .success(let result):
                    strongSelf.currentSessionId = result.sessionId
                    strongSelf.currentSubscription = result.currentSubscription
                    completion?(true)
                case .failure(let error):
                    print("🚫 Receipt Upload Failed: \(error)")
                    completion?(false)
                }
            }
        }
        else {
            self.currentSessionId = ""
        }
        print(self.currentSubscription)
    }
    
    private func loadReceipt() -> Data? {
        guard let url = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            print(data)
            return data
        } catch {
            print("Error loading receipt data: \(error.localizedDescription)")
            return nil
        }
    }
}

extension PurchasesController: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        options = response.products.map { Subscription(product: $0) }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        if request is SKProductsRequest {
            print("Subscription Options Failed Loading: \(error.localizedDescription)")
        }
    }
}

public enum Result<T> {
    case failure(ServiceError)
    case success(T)
}
public typealias LoadSelfieCompletion = (_ selfies: Result<Bool>) -> Void
public typealias UploadReceiptCompletion = (_ result: Result<(sessionId: String, currentSubscription: PaidSubscription?)>) -> Void
public typealias SessionId = String

public enum ServiceError: Error {
    case missingAccountSecret
    case invalidSession
    case noActiveSubscription
    case other(Error)
}

class SessionHandler {
    
    public static let shared = SessionHandler()
    let simulatedStartDate: Date
    
    private var sessions = [SessionId: Session]()
    
    init() {
        let persistedDateKey = "RWSSimulatedStartDate"
        if let persistedDate = UserDefaults.standard.object(forKey: persistedDateKey) as? Date {
            simulatedStartDate = persistedDate
        } else {
            let date = Date().addingTimeInterval(-30) // 30 second difference to account for server/client drift.
            UserDefaults.standard.set(date, forKey: "RWSSimulatedStartDate")
            
            simulatedStartDate = date
        }
    }
    
    
    /// Trade receipt for session id
    public func upload(receipt data: Data, completion: @escaping UploadReceiptCompletion) {
        let body = [
            "receipt-data": data.base64EncodedString(),
            "password": SECRET
        ]
        let bodyData = try! JSONSerialization.data(withJSONObject: body, options: [])
        
        var url : URL
        if(DEVELOPMENT){
            url = URL(string: "https://sandbox.itunes.apple.com/verifyReceipt")!
        }
        else {
            url = URL(string: "https://buy.itunes.apple.com/verifyReceipt")!
            //url = Bundle.main.appStoreReceiptURL!
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = bodyData
        
        let task = URLSession.shared.dataTask(with: request) { (responseData, response, error) in
            if let error = error {
                completion(.failure(.other(error)))
            } else if let responseData = responseData {
                let json = try! JSONSerialization.jsonObject(with: responseData, options: []) as! Dictionary<String, Any>
                let session = Session(receiptData: data, parsedReceipt: json)
                self.sessions[session.id] = session
                let result = (sessionId: session.id, currentSubscription: session.currentSubscription)
                completion(.success(result))
            } else {
                print("Here")
            }
        }
        
        task.resume()
    }
    
    private func paidSubcriptions(since date: Date, for sessionId: SessionId) -> [PaidSubscription] {
        if let session = sessions[sessionId] {
            let subscriptions = session.paidSubscriptions.filter { $0.purchaseDate >= date }
            return subscriptions.sorted { $0.purchaseDate < $1.purchaseDate }
        } else {
            return []
        }
    }
    
    
    public func selfies(for sessionId: SessionId, completion: LoadSelfieCompletion?) {
        print(SECRET)
        //initially !=
        guard SECRET != "142c41b9e7384d469f2b7cbb1f836e53" else {
            completion?(.failure(.missingAccountSecret))
            return
        }
        
        guard let _ = sessions[sessionId] else {
            completion?(.failure(.invalidSession))
            return
        }
        
        let paidSubscriptions = paidSubcriptions(since: simulatedStartDate, for: sessionId)
        guard paidSubscriptions.count > 0 else {
            completion?(.failure(.noActiveSubscription))
            return
        }
        
        /*for (index, subscription) in paidSubscriptions.enumerated() {
            guard let set = selfieSet(number: index) else { continue }
            switch subscription.level {
            case .one:
                selfieSets.append(set.setLimitedToOneSelfie())
            case .all:
                selfieSets.append(set)
            }
        }*/
        full_unlock = true
        
        completion?(.success(full_unlock))
    }
    
    
    
}
