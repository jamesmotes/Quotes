//
//  LoadQuotes.swift
//  Quotes
//
//  Created by James Motes on 2/22/18.
//  Copyright © 2018 JDM. All rights reserved.
//

//TODO: Consolidate moods and categories

import Foundation
import RealmSwift


class LoadQuotes2 {
    let realm = try! Realm()
    
    func MakeQuote(_name : String, _quote : String, _categories : [String], _moods : [String]) -> Void {
        
        let quote = Quote()
        
        quote.person = _name
        quote.text = _quote
        for cat in _categories {
            quote.categories.insert(cat, at: quote.categories.count)
        }
        for mood in _moods {
            quote.categories.insert(mood, at: quote.categories.count)
        }
        quote.id = quoteIterator
        let query = "text CONTAINS '" + _quote + "'"
        //let check = Array(realm.objects(Quote.self).filter(query))
        //if(check.count < 1){
        do {
            try realm.write {
                realm.add(quote)
                quoteIterator += 1
            }
        }
        catch {
            print("Error making quote")
        }
        //}
    }
    
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
         id = iterator
         iterator += 1
         
         */
        

    }
    
    
    
}
