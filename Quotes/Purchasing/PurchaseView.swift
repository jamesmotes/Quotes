//
//  PurchaseView.swift
//  Quotes
//
//  Created by James Motes on 5/6/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import SafariServices


var didPurchase = false
var madePurchase = false

class PurchaseView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var privacyPolicy: UIButton!
    @IBOutlet weak var termsOfUse: UIButton!
    @IBOutlet weak var manageSubscriptions: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var ads: UILabel!
    @IBOutlet weak var notifications: UILabel!
    @IBOutlet weak var categories: UILabel!
    @IBOutlet weak var styles: UILabel!
    @IBOutlet weak var search: UILabel!
    @IBOutlet weak var restoreButton: UIButton!
    @IBOutlet weak var restoreBackground: UIImageView!
    
    @IBOutlet weak var removeAdsImage: UIImageView!
    @IBOutlet weak var notificationsImage: UIImageView!
    @IBOutlet weak var categoriesImage: UIImageView!
    @IBOutlet weak var stylesImage: UIImageView!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var options: [Subscription]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        
        /********************************************/
        //Collection View Setup
        
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        
        /*let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        
        collectionViewFlowLayout.minimumLineSpacing = 0
        
        
        collectionViewFlowLayout.itemSize = CGSize(width: collectionView.frame.width/4, height: 140)
        
        
        
        let totalWidth = collectionView.frame.width
        let itemWidth = totalWidth/4
        let gap = (totalWidth - 3*itemWidth)/2
        
        
        collectionViewFlowLayout.minimumInteritemSpacing = gap
        */
        
        
        
        
        
        
        search.text = "Search People, Categories,\nand Quotes"
        
        backButton.titleLabel?.adjustsFontSizeToFitWidth = true
        header.adjustsFontSizeToFitWidth = true
        /*notifications.adjustsFontSizeToFitWidth = true
        let desc = UIFontDescriptor.init()
        ads.font = UIFont(descriptor: desc, size: (notifications.font.pointSize))
        categories.font = UIFont(descriptor: desc, size: (notifications.font.pointSize))
        styles.font = UIFont(descriptor: desc, size: (notifications.font.pointSize))
        // Do any additional setup after loading the view.
        */
        
        
        /********************************************/
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
    
    func setTheme(){
        if(globalTheme.whiteBackground){
            backButton.setImage(UIImage(named: "BackButtonBlack.png"), for: .normal)
            removeAdsImage.image = UIImage(named: "NoAdsBlack.png")
            notificationsImage.image = UIImage(named: "AlarmIconBlack.png")
            categoriesImage.image = UIImage(named: "CategoriesBlack.png")
            stylesImage.image = UIImage(named: "FontsBlack.png")
            searchImage.image = UIImage(named: "SearchBlack.png")
            
        } else {
            backButton.imageView?.image = UIImage(named: "BackButtonWhite.png")
            removeAdsImage.image = UIImage(named: "NoAdsWhite.png")
            notificationsImage.image = UIImage(named: "AlarmIconWhite.png")
            categoriesImage.image = UIImage(named: "CategoriesWhite.png")
            stylesImage.image = UIImage(named: "FontsWhite.png")
            searchImage.image = UIImage(named: "SearchWhite.png")
        }
        
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.backgroundView = UIView()
        
        /********************************************/
        //font color setup
        backButton.titleLabel?.textColor = globalTheme.getTextColor()
        view.backgroundColor = globalTheme.getBackgroundColor()
        
        header.textColor = globalTheme.getTextColor()
        ads.textColor = globalTheme.getTextColor()
        notifications.textColor = globalTheme.getTextColor()
        categories.textColor = globalTheme.getTextColor()
        styles.textColor = globalTheme.getTextColor()
        search.textColor = globalTheme.getTextColor()
        privacyPolicy.setTitleColor(globalTheme.getTextColor(), for: .normal)
        termsOfUse.setTitleColor(globalTheme.getTextColor(), for: .normal)
        manageSubscriptions.setTitleColor(globalTheme.getTextColor(), for: .normal)
        
        restoreButton.setTitleColor(globalTheme.getTextColor(), for: .normal)
        
        
        
        /********************************************/
        //background image
        
        /*if(globalSchema.imageFile != ""){
            image.image = UIImage(named: globalSchema.imageFile)
        }
        else {
            image.image = nil
        }*/
        image.image = globalTheme.getImage()
        /********************************************/
        //background for restore button image
        
        
        restoreBackground.layer.borderColor = globalTheme.getTextColor()?.cgColor
        restoreBackground.layer.borderWidth = 3.0
        
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
        //PurchasesController.shared.purchase(subscription: options![0])
        IAPService.shared.Purchase(product: .autoRenewingSubscription)
    }
    
    func monthlyAccess() {
        //PurchasesController.shared.purchase(subscription: options![0])
        IAPService.shared.Purchase(product: .autoRenewingSubscription)
    }
    
    func lifetimeAccess() {
        //PurchasesController.shared.purchase(subscription: options![1])
        //IAPService.shared.Purchase(product: .nonRenewingSubscription)
        SwiftyIAP.shared.purchase(purchase: RegisteredPurchase.nonRenewingSubscription)
    }
    
    @IBAction func restoreAccess(_ sender: Any) {
        SwiftyIAP.shared.restorePurchases()
        //showRestoreAlert()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        let scaleFactor = (screenWidth / 3) - 8
        
        return CGSize(width: scaleFactor, height: 140)
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
        didPurchase = true
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
            cell.topText.text = "Monthly\nAccess"
            cell.topText.numberOfLines = 2
            cell.bottomText.text = "$0.99"
        case 2:
            cell.topText.text = "Lifetime\nAccess"
            cell.topText.numberOfLines = 2
            cell.bottomText.text = "$9.99"
        default:
            cell.topText.text = "FREE"
            cell.bottomText.text = "Two Week Trial"
        }
        
        
        cell.topText.textColor = globalTheme.getTextColor()
        cell.bottomText.textColor = globalTheme.getTextColor()
        cell.imageView.layer.borderWidth = 3.0
        cell.imageView.layer.borderColor = globalTheme.getTextColor()?.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch(indexPath.row){
        case 0:
            //trialAccess()
            performSegue(withIdentifier: "showMonthlyConfirm", sender: nil)
        case 1:
            //monthlyAccess()
            performSegue(withIdentifier: "showMonthlyConfirm", sender: nil)
        case 2:
            lifetimeAccess()
        default:
            return
        }
    }
    
    @IBAction func viewPrivacyPolicy(_ sender: Any) {
        if let url = URL(string: "http://gbjmobile.com/privacy_policy.html") {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    @IBAction func viewTermsOfUse(_ sender: Any) {
        if let url = URL(string: "http://gbjmobile.com/terms_and_conditions.html") {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    @IBAction func manageSubscriptions(_ sender: Any) {
        if let url = URL(string: "https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/manageSubscriptions") {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    func showAlert(alert : UIAlertController){
        guard let _ = self.presentedViewController else {
         self.present(alert, animated: true, completion: nil)
         return
         }
        
        
    }
    
    
}
