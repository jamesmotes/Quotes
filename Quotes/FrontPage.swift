//
//  FrontPage.swift
//  Quotes
//
//  Created by James Motes on 2/13/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import RealmSwift

var pers = ""
//var qoutes = ""
var category = ""
var md = ""
var isFavorite = false
var isDownvote = false

class FrontPage: UIViewController {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var person: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    
    let realm = try! Realm()
    
    var quotes : [Quote] = []
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        favButton.tintColor = UIColor.white
        
        var quote = Quote()
        quote.text = "If you want to be in the 1% it's simple, don't do what the 99% do."
        quote.person = "Grant Cardone"
        let cat : String = "Success"
        quote.categories.insert(cat, at: quote.categories.count)
        let mood : String = "Motivational"
        quote.moods.insert(mood, at: quote.moods.count)
        /*try! realm.write {
            realm.add(quote)
        }*/
        quotes = Array(realm.objects(Quote.self))
        quotes.shuffle()
        print(quotes)
        refresh()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true

        showAfterMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAfterMenu() {
        var query : String = ""
        print(category)
        if pers != "" {
            query += "person = '" + pers + "'"
        }
        if category != "" {
            if query != "" {
                query += " AND "
            }
            query += "" // TODO: How do you filter based on items in a list?
        }
        if md != "" {
            if query != "" {
                query += " AND "
            }
            query += "" // TODO: How do you filter based on items in a list?
        }
        if isFavorite {
            if query != "" {
                query += " AND "
            }
            query += "favorite = true"
        }
        if isDownvote {     // Possibly remove when downvote functionality actually works
            if query != "" {
                query += " AND "
            }
            query += "downvote = false"
        }
        
        print("Query: \(query)")
        if query != "" {
            quotes = Array(realm.objects(Quote.self).filter(query))
            print(quotes)
            quotes.shuffle()
            refresh()
        }

        // Reset params
        pers = ""
        category = ""
        md = ""
        isFavorite = false
        isDownvote = false
        
    }

    func refresh(){
        self.text.text = quotes[index].text
        self.person.text = "- " + quotes[index].person
        let query : String = "text == '" + self.text.text! + "'"
        var theQuote = realm.objects(Quote.self).filter(query).first
        if(theQuote?.favorite)!{
            self.favButton.tintColor = UIColor.white
        }
        else {
            self.favButton.tintColor = UIColor.orange
        }
    }
    

    @IBAction func swipedLeft(_ sender: Any) {
        print("Swiped left")
        if(index > 0){
            index -= 1
        }
        else {
            index = quotes.count - 1
        }
        refresh()
    }
    
    @IBAction func swipedRight(_ sender: Any) {
        print("Swiped right")
        if(index < quotes.count - 1){
            index += 1
        }
        else {
            index = 0
        }
        refresh()
    }
    @IBAction func tapped(_ sender: Any) {
        print("tapped")
        /*if(index < quotes.count - 1){
            index += 1
        }
        else {
            index = 0
        }
        refresh()*/
    }
    
    @IBAction func favorite(_ sender: Any) {
        let realm = try! Realm()
        let query : String = "text == '" + self.text.text! + "'"
        var theQuote = realm.objects(Quote.self).filter(query).first
        try! realm.write {
            if(theQuote?.favorite)!{
                theQuote!.favorite = false
                //self.favButton.tintColor = UIColor.white
            }
            else {
                theQuote!.favorite = true
                //self.favButton.tintColor = UIColor.yellow
            }
        }
        theQuote = realm.objects(Quote.self).filter("favorite == true").first
        refresh()
    }
    
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.text.text! + " " + self.person.text!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
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
