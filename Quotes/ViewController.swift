//
//  ViewController.swift
//  Quotes
//
//  Created by James Motes on 12/26/17.
//  Copyright © 2017 JDM. All rights reserved.
//

import UIKit
import AWSMobileClient


let array = ["James Motes", "Elon Musk"]
var person : Int = Int()


let categories = ["Entrepreneur", "Fitness"]
var cat : Int = Int()

class ViewController: UIViewController {

    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var randQuote: UILabel!
    @IBOutlet weak var randPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randQuote.adjustsFontSizeToFitWidth = true
        let per = arc4random_uniform(_: UInt32(array.count))
        let Quote = PeopleQuotes(i:Int(per))
        let quo = arc4random_uniform(_: UInt32(Quote.quotes.count))
        
        randQuote.text = Quote.quotes[Int(quo)]
        randPerson.text = "- " + array[Int(per)]
        
        // Do any additional setup after loading the view, typically from a nib.
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
        let per = arc4random_uniform(_: UInt32(array.count))
        let Quote = PeopleQuotes(i:Int(per))
        let quo = arc4random_uniform(_: UInt32(Quote.quotes.count))
        
        randQuote.text = Quote.quotes[Int(quo)]
        randPerson.text = "- " + array[Int(per)]
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        let per = arc4random_uniform(_: UInt32(array.count))
        let Quote = PeopleQuotes(i:Int(per))
        let quo = arc4random_uniform(_: UInt32(Quote.quotes.count))
        
        randQuote.text = Quote.quotes[Int(quo)]
        randPerson.text = "- " + array[Int(per)]
    }
}

