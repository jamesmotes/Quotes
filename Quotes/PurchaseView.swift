//
//  PurchaseView.swift
//  Quotes
//
//  Created by James Motes on 5/6/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit


var didPurchase = false
var madePurchase = false

class PurchaseView: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var twoWeekButton: UIButton!
    @IBOutlet weak var monthlyButton: UIButton!
    @IBOutlet weak var fullButton: UIButton!
    
    var options: [Subscription]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        backButton.titleLabel?.textColor = globalFontColor
        twoWeekButton.titleLabel?.textColor = globalFontColor
        monthlyButton.titleLabel?.textColor = globalFontColor
        fullButton.titleLabel?.textColor = globalFontColor
        view.backgroundColor = globalBackgroundColor
        
        
        backButton.titleLabel?.adjustsFontSizeToFitWidth = true
        twoWeekButton.titleLabel?.adjustsFontSizeToFitWidth = true
        monthlyButton.titleLabel?.adjustsFontSizeToFitWidth = true
        let desc = UIFontDescriptor.init()
        fullButton.titleLabel?.font = UIFont(descriptor: desc, size: (monthlyButton.titleLabel?.font.pointSize)!)
        
        
        // Do any additional setup after loading the view.
        
        //purchasing stuff
        options = PurchasesController.shared.options
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleOptionsLoaded(notification:)),
                                               name: PurchasesController.optionsLoadedNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handlePurchaseSuccessfull(notification:)),
                                               name: PurchasesController.purchaseSuccessfulNotification,
                                               object: nil)
    }
    
    @objc func handleOptionsLoaded(notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            self?.options = PurchasesController.shared.options
        }
    }
    
    @objc func handlePurchaseSuccessfull(notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            madePurchase = true
            self?.dismiss(animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func trialAccess(_ sender: Any) {
        PurchasesController.shared.purchase(subscription: options![0])
    }
    
    @IBAction func monthlyAccess(_ sender: Any) {
        PurchasesController.shared.purchase(subscription: options![0])
    }
    
    @IBAction func lifetimeAccess(_ sender: Any) {
        PurchasesController.shared.purchase(subscription: options![1])
    }
    
    private func showRestoreAlert() {
        let alert = UIAlertController(title: "Subscription Issue", message: "We are having a hard time finding your subscription. If you've recently reinstalled the app or got a new device please choose to restore your purchase. Otherwise go Back to Subscribe.", preferredStyle: .alert)
        
        let restoreAction = UIAlertAction(title: "Restore", style: .default) { [weak self] _ in
            PurchasesController.shared.restorePurchases()
            self?.showRestoreInProgressAlert()
        }
        
        let backAction = UIAlertAction(title: "Back", style: .cancel) { _ in
            _ = self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(restoreAction)
        alert.addAction(backAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showRestoreInProgressAlert() {
        let alert = UIAlertController(title: "Restoring Purchase", message: "Your purchase history is being restored. Upon completion this dialog will close and you will be sent back to the previous screen where you can then comeback in to load your purchases.", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(PurchaseView.dismissRestoreInProgressAlert(notification:)), name: PurchasesController.restoreSuccessfulNotification, object: nil)
    }
    
    @objc private func dismissRestoreInProgressAlert(notification: Notification) {
        dismiss(animated: true, completion: nil)
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
