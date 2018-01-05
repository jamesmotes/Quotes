//
//  ViewCategoriesQuotes.swift
//  Quotes
//
//  Created by James Motes on 1/5/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class ViewCategoriesQuotes: UIViewController {

    var quotes = CategoryQuotes(i: -1)
    var it = 0
    
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quotes = CategoryQuotes(i: cat)
        quote.adjustsFontSizeToFitWidth = true
        quote.text = [String](quotes.quotes.values)[it]
        name.text = "- " + [String](quotes.quotes.keys)[it]
        
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
        quote.text = [String](quotes.quotes.values)[it]
        name.text = "- " + [String](quotes.quotes.keys)[it]
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
