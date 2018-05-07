//
//  PurchasePerson.swift
//  Quotes
//
//  Created by James Motes on 1/24/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import StoreKit

class PurchasePerson: UIViewController {
    
    //var purchasesController: PurchasesControllerProtocol = PurchasesController(withProductIDs: ["thomas_jefferson", "gabriel_wang"])

    @IBOutlet weak var MainText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //MainText.text = "It looks like you have not unlocked " + array[person] + " :("
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unlockPerson(_ sender: Any) {
        //purchasesController.buyItem(withProductID: locked[array[person]]!)
        purchasesController.onPurchase = {
            (itemID) in
            //dict[array[person]] = true
            
            self.performSegue(withIdentifier: "backToPeople", sender: nil)
        }
        purchasesController.onRestore = {
            (itemID) in
            //dict[array[person]] = true
            self.performSegue(withIdentifier: "backToPeople", sender: nil)
        }
    }


}
