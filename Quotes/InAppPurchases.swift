//
//  InAppPurchases.swift
//  Quotes
//
//  Created by James Motes on 1/8/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import StoreKit



class InAppPurchases: NSObject{
    
    private override init() {}
    static let shared = InAppPurchases()
    
    var processing : Bool = Bool()
    var purchased : Bool = Bool()
    
    var products = [SKProduct]()
    let paymentQueue = SKPaymentQueue.default()
    
    func getProducts() {
        let products: Set = ["thomas_jefferson", "gabriel_wang"]
        
        let request = SKProductsRequest(productIdentifiers: products)
        request.delegate = self
        request.start()
        paymentQueue.add(self)
    }
    
    func purchase(product: String){
        purchased = false
        guard let purchaseItem = products.filter({ $0.productIdentifier == product}).first else {processing = false; return}
        let payment = SKPayment(product: purchaseItem)
        paymentQueue.add(payment)
        purchased = true
        processing = false;
    }
    
    func restorePurchases() {
        print("restoring purchases")
        paymentQueue.restoreCompletedTransactions()
    }
    
}

extension InAppPurchases: SKProductsRequestDelegate {
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
        for product in response.products {
            print(product.localizedTitle)
        }
    }
}

extension InAppPurchases: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing: break
            default: queue.finishTransaction(transaction)
            }
        }
    }
}

extension SKPaymentTransactionState {
    func status() -> String {
        switch self {
        case .deferred : return("deferred")
        case .failed : return("falied")
        case .purchased : return("purchased")
        case .purchasing : return("purchasing")
        case .restored : return("restored")
        }
    }
}








