//
//  ConfirmMonthlyView.swift
//  Quotes
//
//  Created by James Motes on 5/21/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class ConfirmMonthlyView: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var confirmPurchaseBackground: UIImageView!
    @IBOutlet weak var confirmPurchaseButton: UIButton!
    
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var atTimeOfPurchase: UILabel!
    @IBOutlet weak var freeTrial: UILabel!
    @IBOutlet weak var autoRenew: UILabel!
    @IBOutlet weak var charged24: UILabel!
    @IBOutlet weak var managedAt: UILabel!
    @IBOutlet weak var unusedFree: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    var options: [Subscription]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        options = PurchasesController.shared.options
        setTheme()
        // Do any additional setup after loading the view.
    }
    
    func setTheme(){
        if(globalTheme.whiteBackground){
            backButton.setImage(UIImage(named: "BackButtonBlack.png"), for: .normal)
        } else {
            backButton.imageView?.image = UIImage(named: "BackButtonWhite.png")
        }
        
        /********************************************/
        //font color setup
        backButton.titleLabel?.textColor = globalTheme.getTextColor()
        view.backgroundColor = globalTheme.getBackgroundColor()
        
        itemTitle.textColor = globalTheme.getTextColor()
        headerText.textColor = globalTheme.getTextColor()
        priceLabel.textColor = globalTheme.getTextColor()
        freeTrial.textColor = globalTheme.getTextColor()
        autoRenew.textColor = globalTheme.getTextColor()
        charged24.textColor = globalTheme.getTextColor()
        managedAt.textColor = globalTheme.getTextColor()
        unusedFree.textColor = globalTheme.getTextColor()
        confirmPurchaseButton.setTitleColor(globalTheme.getTextColor(), for: .normal)
        
        
        
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
        
        
        confirmPurchaseBackground.layer.borderColor = globalTheme.getTextColor()?.cgColor
        confirmPurchaseBackground.layer.borderWidth = 3.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmPurchase(_ sender: Any) {
        PurchasesController.shared.purchase(subscription: options![0])
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
