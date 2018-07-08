//
//  IAPService.swift
//  Quotes
//
//  Created by James Motes on 6/20/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation
import StoreKit

class IAPService: NSObject {
    
    private override init() {}
    static let shared = IAPService()
    
    var products = [SKProduct]()
    let paymentQueue = SKPaymentQueue.default()
    
    func GetProducts() {
        let products: Set = [IAPProducts.autoRenewingSubscription.rawValue,
                             IAPProducts.nonRenewingSubscription.rawValue]
        let request = SKProductsRequest(productIdentifiers: products)
        request.delegate = self
        request.start()
        paymentQueue.add(self)
    }
    
    func Purchase(product: IAPProducts) {
        guard let productToPurchase = products.filter({ $0.productIdentifier == product.rawValue}).first
            else { return }
        let payment = SKPayment(product: productToPurchase)
        paymentQueue.add(payment)
    }
    
}

extension IAPService : SKProductsRequestDelegate {
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
        for product in response.products {
            print(product.localizedTitle)
        }
    }
}

extension IAPService : SKPaymentTransactionObserver {
    //TODO may be where to identify when purchases have been made and set variables to proper state
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            print(transaction.transactionState.Status(), transaction.payment.productIdentifier)
            switch transaction.transactionState {
            case .purchasing: break
            default: queue.finishTransaction(transaction)
            }
        }
    }
}

extension SKPaymentTransactionState {
    
    func Status() -> String {
        switch self {
        case .deferred: return String("deffered")
        case .failed: return String("failed")
        case .purchased: return String("purchased")
        case .purchasing: return String("purchasing")
        case .restored: return String("restored")
        }
    }
}





