//
//  ViewPersonQuotes.swift
//  Quotes
//
//  Created by James Motes on 1/5/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class ViewPersonQuotes: UIViewController {

    var quotes = PeopleQuotes(i: -1)
    var it = 0;
    
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quotes = PeopleQuotes(i: person)
        quote.adjustsFontSizeToFitWidth = true
        refresh()
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swipeRight(_ sender: Any) {
        if(it == 0){
            it = (quotes.quotes.count) - 1
        }
        else {
            it = (it-1)
        }
        refresh()
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        it = (it+1)%(quotes.quotes.count)
        refresh()
    }
    
    func refresh(){
        quote.text = quotes.quotes[it]
        name.text = "- " + array[person]
        
        if favorites.keys.contains(String(describing: quote.text!)) {
            favButton.tintColor = UIColor.red
        }
        else {
            favButton.tintColor = UIColor.darkGray
        }
    }
    
    @IBAction func clickedFavButton(_ sender: Any) {
        if(favButton.tintColor == UIColor.darkGray){
            favorites[String(describing: quote.text!)] = String(describing: name.text!.dropFirst(2))
            favButton.tintColor = UIColor.red
        }
        else {
            favorites.removeValue(forKey: String(describing: quote.text!))
            favButton.tintColor = UIColor.darkGray
        }
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
