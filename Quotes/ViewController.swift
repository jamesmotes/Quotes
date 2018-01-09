//
//  ViewController.swift
//  Quotes
//
//  Created by James Motes on 12/26/17.
//  Copyright © 2017 JDM. All rights reserved.
//

import UIKit


var dict = ["James Motes": true, "Elon Musk": true, "Blake Nelson": true, "Thomas Jefferson": false, "DJ Khaled": true]
var array = ["James Motes", "Elon Musk", "Blake Nelson", "Thomas Jefferson", "DJ Khaled"]
var person : Int = Int()


let categories = ["Entrepreneur", "Fitness"]
var cat : Int = Int()

var favorites : [String: String] = [:]

class ViewController: UIViewController {

    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var randQuote: UILabel!
    @IBOutlet weak var randPerson: UILabel!
    
    @IBOutlet weak var favButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randQuote.adjustsFontSizeToFitWidth = true
        refresh()
        initIAP()
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMenu(_ sender: Any) {
        if leadingConstraint.constant == 100{
            leadingConstraint.constant = 0
            trailingConstraint.constant = trailingConstraint.constant - 100
        } else {
            leadingConstraint.constant = 100
            trailingConstraint.constant = trailingConstraint.constant + 100
        }
    }
    
    @IBAction func swipeRight(_ sender: Any) {
        refresh()
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        refresh()
    }
    
    func refresh(){
        let per = arc4random_uniform(_: UInt32(array.count))
        let Quote = PeopleQuotes(i:Int(per))
        let quo = arc4random_uniform(_: UInt32(Quote.quotes.count))
        
        if(dict[array[Int(per)]] == true){
            randQuote.text = Quote.quotes[Int(quo)]
            randPerson.text = "- " + array[Int(per)]
            
            if favorites.keys.contains(String(describing: randQuote.text!)) {
                favButton.tintColor = UIColor.orange
            }
            else {
                favButton.tintColor = UIColor.darkGray
            }
        }
        else {
            refresh()
        }
        
        
    }
    
    @IBAction func clickedFavoriteButton(_ sender: Any) {
        if(favButton.tintColor == UIColor.orange){
            favorites.removeValue(forKey: String(describing: randQuote.text!))
            favButton.tintColor = UIColor.darkGray
        }
        else {
            favorites[String(describing: randQuote.text!)] = String(describing: randPerson.text!.dropFirst(2))
            favButton.tintColor = UIColor.orange
        }
    }
    
    
    @IBAction func clickedShareButton(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.randQuote.text! + " " + self.randPerson.text!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func initIAP(){
        InAppPurchases.shared.getProducts()
        //InAppPurchases.shared.restorePurchases()
    }
    
}

