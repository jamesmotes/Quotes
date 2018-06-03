//
//  ContactInfo.swift
//  Quotes
//
//  Created by Blake Nelson on 4/21/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class ContactInfo: UIViewController {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var text: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        
        // Do any additional setup after loading the view.
    }
    
    func setTheme(){
        if(globalTheme.whiteBackground){
            backButton.setImage(UIImage(named: "BackButtonBlack.png"), for: .normal)
        } else {
            backButton.imageView?.image = UIImage(named: "BackButtonWhite.png")
        }
        
        view.backgroundColor = globalTheme.getBackgroundColor()
        
        text.textColor = globalTheme.getTextColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        let email = "contact@gbjmobile.com"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
}
