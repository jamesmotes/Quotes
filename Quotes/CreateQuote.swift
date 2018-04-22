//
//  CreateQuote.swift
//  
//
//  Created by Blake Nelson on 4/22/18.
//

import UIKit

class CreateQuote: UIViewController {

    @IBOutlet weak var customQuote: UITextField!
    @IBOutlet weak var customName: UITextField!
    @IBOutlet weak var creationButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var person: UILabel!
    @IBOutlet weak var text: UILabel!
    
    var creating : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        editButton.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createQuote(_ sender: Any) {
        if(creating){
            creating = false
            person.text = customName.text
            person.font = UIFont(name: globalFontStyle, size: 20)
            person.textColor = globalFontColor
            text.text = customQuote.text
            text.font = UIFont(name: globalFontStyle, size: 42)
            text.textColor = globalFontColor
            self.view.backgroundColor = globalBackgroundColor
            
            customName.isHidden = true
            customQuote.isHidden = true
            
            customName.isEnabled = false
            customQuote.isEnabled = false
            
            creationButton.titleLabel?.text = "Save Quote"
            editButton.isHidden = false
        }
        else {
            print("Save Quote")
        }
    }
    
    
    @IBAction func clickedEdit(_ sender: Any) {
        creating = true
        customName.isHidden = false
        customQuote.isHidden = false
        
        customName.isEnabled = true
        customQuote.isEnabled = true
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
