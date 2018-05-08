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

class PurchaseView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var backButton: UIButton!

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var options: [Subscription]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /********************************************/
        //Collection View Setup
        
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView.backgroundColor = UIColor.black
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        collectionViewFlowLayout.minimumLineSpacing = 0
        
        
        collectionViewFlowLayout.itemSize = CGSize(width: collectionView.frame.width/4, height: 140)
        
        
        /********************************************/

        backButton.titleLabel?.textColor = globalFontColor
        view.backgroundColor = globalBackgroundColor
        
        
        backButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        
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
            full_unlock = true
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
    
    func trialAccess() {
        PurchasesController.shared.purchase(subscription: options![0])
    }
    
    func monthlyAccess() {
        PurchasesController.shared.purchase(subscription: options![0])
    }
    
    func lifetimeAccess() {
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
    
    //collection view functionality
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pricingCell", for: indexPath) as! PricingCollectionViewCell
        
        /*
        //make fonts same sizes for all the buttons
        twoWeekButton.titleLabel?.adjustsFontSizeToFitWidth = true
        monthlyButton.titleLabel?.adjustsFontSizeToFitWidth = true
        let desc = UIFontDescriptor.init()
        fullButton.titleLabel?.font = UIFont(descriptor: desc, size: (monthlyButton.titleLabel?.font.pointSize)!)
        */
        
        switch(indexPath.row){
        case 0:
            cell.topText.text = "FREE"
            cell.bottomText.text = "Two Week Trial!"
            cell.topText.adjustsFontSizeToFitWidth = true
            cell.bottomText.adjustsFontSizeToFitWidth = true
        case 1:
            cell.topText.text = "One\nMonth"
            cell.topText.numberOfLines = 2
            cell.bottomText.text = "0.99"
        case 2:
            cell.topText.text = "Lifetime\nAccess"
            cell.topText.numberOfLines = 2
            cell.bottomText.text = "9.99"
        default:
            cell.topText.text = "FREE"
            cell.bottomText.text = "Two Week Trial"
        }
        
        
        cell.topText.textColor = globalFontColor
        cell.bottomText.textColor = globalFontColor
        cell.imageView.layer.borderWidth = 3.0
        cell.imageView.layer.borderColor = globalFontColor.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch(indexPath.row){
        case 0:
            trialAccess()
        case 1:
            monthlyAccess()
        case 2:
            lifetimeAccess()
        default:
            return
        }
    }
    
    
}
