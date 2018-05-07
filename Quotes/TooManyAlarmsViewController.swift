//
//  TooManyAlarmsViewController.swift
//  Quotes
//
//  Created by James Motes on 5/6/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class TooManyAlarmsViewController: UIViewController {
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.textColor = globalFontColor
        purchaseButton.titleLabel?.textColor = globalFontColor
        backButton.titleLabel?.textColor = globalFontColor
        view.backgroundColor = globalBackgroundColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToPurchase(_ sender: Any) {
        performSegue(withIdentifier: "alarmToPurchase", sender: nil)
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
