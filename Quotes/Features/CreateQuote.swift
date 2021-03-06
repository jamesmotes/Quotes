//
//  CreateQuote.swift
//  
//
//  Created by Blake Nelson on 4/22/18.
//

import UIKit
import RealmSwift

var editQuote = false
var editingQuote : Quote = Quote()
var editedQuote : Quote = Quote()

class CreateQuote: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var customQuote: UITextField!
    @IBOutlet weak var customName: UITextField!
    @IBOutlet weak var creationButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var person: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var saveQuote: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    let realm = try! Realm()
    
    var creating : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        /*if(whiteBackground){ backButton.setBackgroundImage(UIImage(named: "BackButtonBlack.png"), for: UIControlState.normal)
        }
        else {
            backButton.setBackgroundImage(UIImage(named: "BackButtonWhite.png"), for: UIControlState.normal)
        }*/
        
        // Do any additional setup after loading the view.
        self.customQuote.delegate = self
        self.customName.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if editQuote {
            customQuote.text = editingQuote.text
            customName.text = editingQuote.person
        }
        editButton.isHidden = true
        setTheme()
    }
    
    func setTheme(){
        if(globalTheme.whiteBackground){
            backButton.setImage(UIImage(named: "BackButtonBlack.png"), for: .normal)
            view.backgroundColor = UIColor.white
            creationButton.titleLabel?.textColor = UIColor.black
        } else {
            backButton.imageView?.image = UIImage(named: "BackButtonWhite.png")
            view.backgroundColor = globalTheme.getBackgroundColor()
            creationButton.titleLabel?.textColor = UIColor.white
        }
        
        /*if(globalTheme.imageFile != ""){
            image.image = UIImage(named: globalTheme.imageFile)
        }*/
        image.image = globalTheme.getImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createQuote(_ sender: Any) {
        creating = false
        
        person.text = "- " + customName.text!
        
        text.text = customQuote.text
        
        customName.isHidden = true
        customQuote.isHidden = true
        
        customName.isEnabled = false
        customQuote.isEnabled = false
        
        savedQuote()
        /*
        //creationButton.titleLabel?.text = "Save Quote"
        editButton.isHidden = false
        creationButton.isHidden = true
        saveQuote.isHidden = false
        
        editButton.isEnabled = true
        saveQuote.isEnabled = true
        creationButton.isEnabled = false
        
        text.isHidden = false
        person.isHidden = false
 */
    }
    
    
    //@IBAction func savedQuote(_ sender: Any) {
    func savedQuote(){
        print("Save Quote")
        let quote = Quote()
        quote.person = customName.text!
        quote.text = customQuote.text!
        quote.categories.insert("Custom", at: quote.categories.count)
        quote.id = quoteIterator
        quoteIterator += 1
        quote.custom = true
        
        if(editQuote){
            do {
                try realm.write {
                    realm.delete(editingQuote)
                    editedQuote = quote
                }
            }
            catch {
                print("Error editing/deleting personal quote")
            }
        }
        do {
            try realm.write {
                realm.add(quote)
            }
        }
        catch {
            print("Error adding personal quote")
        }
        
        addedPersonalQuote = true
        
        dismiss(animated: true, completion: nil)
        let defaults = UserDefaults.standard
        defaults.set(quoteIterator, forKey: "quoteIterator")
    }
    
    
    @IBAction func clickedEdit(_ sender: Any) {
        creating = true
        //creationButton.titleLabel?.text = "Create Quote"
        customName.isHidden = false
        customQuote.isHidden = false
        
        customName.isEnabled = true
        customQuote.isEnabled = true
        
        editButton.isHidden = true
        creationButton.isHidden = false
        saveQuote.isHidden = true
        
        editButton.isEnabled = false
        saveQuote.isEnabled = false
        creationButton.isEnabled = true
        
        text.isHidden = true
        person.isHidden = true
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
