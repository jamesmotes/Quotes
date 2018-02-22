//
//  FrontPage.swift
//  Quotes
//
//  Created by James Motes on 2/13/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import RealmSwift

class FrontPage: UIViewController {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var person: UILabel!
    
    
    let realm = try! Realm()
    
    var quotes : [Quote] = []
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refresh(){
        self.text.text = quotes[index].text
        self.person.text = quotes[index].person
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
        if(index < quotes.count - 1){
            index += 1
        }
        else {
            index = 0
        }
        refresh()
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
