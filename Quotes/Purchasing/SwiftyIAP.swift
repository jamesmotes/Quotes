//
//  SwiftyIAP.swift
//  Quotes
//
//  Created by James Motes on 6/30/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation
import StoreKit
import SwiftyStoreKit


var SECRET = "142c41b9e7384d469f2b7cbb1f836e53"

enum RegisteredPurchase : String {
    case autoRenewingSubscription = "feature_access"
    case nonRenewingSubscription  = "lifetime_access"
}

class NetworkActivityIndicatorManager : NSObject {

    private static var loadingCount = 0
    
    
    class func NetworkOperationsStarted() {
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        loadingCount += 1
    }
    class func networkOperationFinished(){
        if loadingCount > 0 {
            loadingCount -= 1
        }
        if loadingCount == 0{
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

class SwiftyIAP : NSObject {
    
    
    private override init() {}
    static let shared = SwiftyIAP()
    
    
    let bundleID = "com.JDM.Quotes"
    
    var monthly = RegisteredPurchase.autoRenewingSubscription
    var lifetime = RegisteredPurchase.nonRenewingSubscription
    
    func getInfo(purchase : RegisteredPurchase){
        NetworkActivityIndicatorManager.NetworkOperationsStarted()
        SwiftyStoreKit.retrieveProductsInfo([purchase.rawValue], completion: {
            result in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            self.showAlert(alert: self.alertForProductRetrievalInfo(result: result))
            })
    }
    
    func purchase(purchase : RegisteredPurchase){
        NetworkActivityIndicatorManager.NetworkOperationsStarted()
        SwiftyStoreKit.purchaseProduct(purchase.rawValue, completion: {
            result in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            if case .success(let product) = result {
                if product.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
                self.showAlert(alert: self.alertForPurchaseResult(result: result))
            }
        })
    }
    
    func restorePurchases() {
        NetworkActivityIndicatorManager.NetworkOperationsStarted()
        SwiftyStoreKit.restorePurchases(atomically: true, completion: {
            result in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            for product in result.restoredPurchases {
                if product.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
            }
            
            self.showAlert(alert: self.alertForRestorPurchases(result: result))
            
        })
    }
    
    func verifyReceipt(){
        NetworkActivityIndicatorManager.NetworkOperationsStarted()
        var validator = AppleReceiptValidator(service: .production, sharedSecret: SECRET)
        if(DEVELOPMENT){
            validator = AppleReceiptValidator(service: .sandbox, sharedSecret: SECRET)
        }
        SwiftyStoreKit.verifyReceipt(using: validator, completion: {
            result in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            self.showAlert(alert: self.alertForVerifyReceipt(result: result))
            print(result)
            if case .error(let error) = result {
                if case .noReceiptData = error {
                    self.refreshReceipt()
                }
            }
            
        })
    }
    
    func verifyPurchase(product : RegisteredPurchase){
        NetworkActivityIndicatorManager.NetworkOperationsStarted()
        let validator = AppleReceiptValidator(service: .production, sharedSecret: SECRET)
        SwiftyStoreKit.verifyReceipt(using: validator, completion: {
            result in
            NetworkActivityIndicatorManager.networkOperationFinished()
            
            switch result {
            case .success(let receipt):
                let productID = product.rawValue
                
                if product == .autoRenewingSubscription {
                    let purchaseResult = SwiftyStoreKit.verifySubscription(ofType: SubscriptionType.autoRenewable, productId: productID, inReceipt: receipt, validUntil: Date())
                    self.showAlert(alert: self.alertForVerifySubscription(result: purchaseResult))
                }
                    //normally would have a different for regular pruchases. May need to revert to that
                else {
                    let purchaseResult = SwiftyStoreKit.verifySubscription(ofType: SubscriptionType.nonRenewing(validDuration: TimeInterval.infinity), productId: productID, inReceipt: receipt)
                    self.showAlert(alert: self.alertForVerifySubscription(result: purchaseResult))
                }
            case .error(let error):
                self.showAlert(alert: self.alertForVerifyReceipt(result: result))
                if case .noReceiptData = error {
                    self.refreshReceipt()
                }
                
            }
            
        })
    }
    
    func refreshReceipt(){
        SwiftyStoreKit.fetchReceipt(forceRefresh: true, completion: {
            result in
            //not defined bc swifty store kit is different than in the tutorial
            //self.showAlert(alert: self.alertForRefreshReceipt(result: result))
            
        })
    }
    
}

extension SwiftyIAP {
    func alertWithTitle(title : String, message : String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
    
    func showAlert(alert : UIAlertController){
        /*guard let _ = self.presentedViewController else {
            UIApplication.present(alert, animated: true, completion: nil)
            return
        }*/
        UIApplication.shared.delegate?.window??.inputViewController?.present(alert, animated: true, completion: nil)
        
    }
    
    func alertForProductRetrievalInfo(result: RetrieveResults) ->UIAlertController {
        if let product = result.retrievedProducts.first {
            let priceString = product.localizedPrice!
            return alertWithTitle(title: product.localizedTitle, message: "\(product.localizedDescription) - \(priceString)")
        }
        else if let invalidProductID = result.invalidProductIDs.first {
            return alertWithTitle(title: "Could not retrieve product info", message: "Invalid product identifier: \(invalidProductID)")
        }
        else {
            let errorString = result.error?.localizedDescription ?? "Unkown Error. Please Contact Support"
            return alertWithTitle(title: "could not retrieve product info", message: errorString)
        }
    }
    
    func alertForPurchaseResult(result : PurchaseResult) -> UIAlertController {
        switch result {
        case .success(let product):
            print("Purhcase successful: \(product.productId)")
            return alertWithTitle(title: "Thank You", message: "Purhcase completed")
        case .error(let error):
            print("Purchase Failed: \(error)")
            
            return alertWithTitle(title: "Purchase Failed", message: "Please try again later. If problem persists please contact support.")
            
            //TODO Figure out updated version of this and print out more descriptive error messages
            /*switch error {
            case .failed(let error):
                if (error as NSError).domain == SKErrorDomain {
                    return alertWithTitle(title: "Purchase Failed", message: "Check your internet connection or try again later.")
                }
                else {
                    return alertWithTitle(title: "Purhcase Failed", message: "Unkown Error. Please Contact Support")
                }
            case .invalidProductID(let productID):
                return alertWithTitle(title: "Purchase Failed", message: "\(productID) is not a valid product identifier")
            case .noProductID:
                return alertWithTitle(title: "Purchase Failed", message: "Product not found")
            case .paymentNotAllowed:
                return alertWithTitle(title: "Purchase Failed", message: "You are not allowed to make payments")
            }*/
        }
    }
    
    func alertForRestorPurchases(result : RestoreResults) -> UIAlertController {
        if result.restoreFailedPurchases.count > 0 {
            print("Restore Failed: \(result.restoreFailedPurchases)")
            return alertWithTitle(title: "Restore Failed", message: "Unknown Error. Please Contact Support")
        }
        else if result.restoredPurchases.count > 0 {
            return alertWithTitle(title: "Purchases Restored", message: "All purchases have been restored.")
        }
        else {
            return alertWithTitle(title: "Nothing To Restore", message: "No previous purchases were made.")
        }
    }
    
    func alertForVerifyReceipt(result : VerifyReceiptResult) -> UIAlertController {
        switch result {
        case .success(let receipt):
            return alertWithTitle(title: "Receipt Verified", message: "Receipt Verified Remotely")
        case .error(let error):
            switch error {
            case .noReceiptData:
                return alertWithTitle(title: "Receipt Verification", message: "No receipt data found, application will try to get a new one. Try Again.")
            default:
                return alertWithTitle(title: "Receipt Verification", message: "Receipt Verification Failed")
            }
        }
    }
    
    func alertForVerifySubscription(result : VerifySubscriptionResult) -> UIAlertController {
        switch result {
        case .purchased(let expiryDate):
            return alertWithTitle(title: "Product Is Purchased", message: "Product is valid until \(expiryDate)")
        case .notPurchased:
            return alertWithTitle(title: "Not Purchased", message: "This product has never been purchased")
        case .expired(let expiryDate):
            return alertWithTitle(title: "Product Expired", message: "Product is expired since \(expiryDate)")
        }
    }
    
    func alertForVerifyPurchase(result : VerifyPurchaseResult) -> UIAlertController {
        switch result {
        case .purchased:
            return alertWithTitle(title: "Product Is Purchased", message: "Product will not expire")
        case .notPurchased:
            return alertWithTitle(title: "Product Not Purchased", message: "Product has never been purchased")
        }
    }
    
    /*func alertForRefreshReceipt(result : FetchReceiptResult) -> UIAlertController {
        switch result {
        case .success(let receiptData):
            return alertWithTitle(title: "Receipt Refreshed, message: <#T##String#>)
        }
    }*/
}














