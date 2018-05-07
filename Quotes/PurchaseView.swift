//
//  PurchaseView.swift
//  Quotes
//
//  Created by James Motes on 5/6/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit


var didPurchase = false

class PurchaseView: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var twoWeekButton: UIButton!
    @IBOutlet weak var monthlyButton: UIButton!
    @IBOutlet weak var fullButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.purchasedLifeTimeAccess),name:NSNotification.Name(rawValue: "purchasedLifeTimeAccess"), object: nil)

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func trialAccess(_ sender: Any) {
    }
    
    @IBAction func monthlyAccess(_ sender: Any) {
    }
    
    @IBAction func lifetimeAccess(_ sender: Any) {
        
        didPurchase = false
        
        purchasesController.buyItem(withProductID: "full_unlock")
        purchasesController.onPurchase = {
            (itemID) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "purchasedLifeTimeAccess"), object: nil)
        }
        purchasesController.onRestore = {
            (itemID) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "purchasedLifeTimeAccess"), object: nil)
        }
    }
    
    @objc func purchasedLifeTimeAccess(){
        full_unlock = true
        let defaults = UserDefaults.standard
        defaults.setValue(true, forKeyPath: "full_unlock")
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
