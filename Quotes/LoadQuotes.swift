//
//  LoadQuotes.swift
//  Quotes
//
//  Created by James Motes on 2/22/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class LoadQuotes {
    let realm = try! Realm()
    init(){
        
        
        var name : String = String()
        var text : String = String()
        var cats : [String] = [String]()
        var moos : [String] = [String]()
        
        /*Copy and paste this block for each quote
         name = ""              //put the person's name here once at the start of that person's quotes
         
         text = ""              //put quote here
         cats = []              //put categories here
         moos = []              //put moods here
         MakeQuote(name, text, cats, moos)
 
         */
        
        
        //Elon Musk
        name = "Elon Musk"
        
        text = "My mentality is that of a samurai. I would rather commit seppuku than fail."
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When I was in college, I wanted to be involved in things that would change the world."
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        
        //Thomas Jefferson
        name = "Thomas Jefferson"
        
        text = "Walking is the best possible exercise. Habituate yourself to walk very far."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        
        
    }
    
    func MakeQuote(_name : String, _quote : String, _categories : [String], _moods : [String]) -> Void {
        
        var quote = Quote()
        
        quote.person = _name
        quote.text = _quote
        for cat in _categories {
            quote.categories.insert(cat, at: quote.categories.count)
        }
        for mood in _moods {
            quote.moods.insert(mood, at: quote.moods.count)
        }
        try! realm.write {
            realm.add(quote)
        }
    }
    
    
}
