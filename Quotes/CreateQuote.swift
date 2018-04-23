//
//  CreateQuote.swift
//  
//
//  Created by Blake Nelson on 4/22/18.
//

import UIKit
import RealmSwift

class CreateQuote: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var customQuote: UITextField!
    @IBOutlet weak var customName: UITextField!
    @IBOutlet weak var creationButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var person: UILabel!
    @IBOutlet weak var text: UILabel!
    
    let realm = try! Realm()
    
    var creating : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        self.customQuote.delegate = self
        self.customName.delegate = self
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
            
            text.text = customQuote.text
            
            
            
            customName.isHidden = true
            customQuote.isHidden = true
            
            customName.isEnabled = false
            customQuote.isEnabled = false
            
            creationButton.titleLabel?.text = "Save Quote"
            editButton.isHidden = false
        }
        else {
            print("Save Quote")
            let quote = Quote()
            quote.person = "- " + person.text!
            quote.text = text.text!
            quote.categories.insert("Custom", at: quote.categories.count)
            quote.id = quoteIterator
            quoteIterator += 1
            quote.custom = true
            
            try! realm.write {
                realm.add(quote)
            }
            dismiss(animated: true, completion: nil)
            let defaults = UserDefaults.standard
            defaults.set(quoteIterator, forKey: "quoteIterator")
        }
    }
    
    
    @IBAction func clickedEdit(_ sender: Any) {
        creating = true
        creationButton.titleLabel?.text = "Create Quote"
        customName.isHidden = false
        customQuote.isHidden = false
        
        customName.isEnabled = true
        customQuote.isEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return false
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
