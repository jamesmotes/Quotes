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
        refresh()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refresh(){
        var quote = realm.objects(Quote.self).filter("person = 'Grant Cardone' AND text BEGINSWITH 'I'")
        print(quote)
        self.text.text = quote[0].text
        self.person.text = quote[0].person
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
