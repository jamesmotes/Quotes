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
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When I was in college, I wanted to be involved in things that would change the world."
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If there was a way I could not eat, so I could work more, I would not eat. I wish there was a way to get nutrients without sitting down for a meal."
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you get up in the morning and think the future is going to be better it is a bright day. Otherwise, it's not. "
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think it's very important to have a feedback loop, where you're constantly thinking about what you've done and how you could be doing it better. I think that's the single best piece of advice: constantly think about how you could be doing things better and questioning yourself."
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When Henry Ford made cheap, reliable cars people said, 'Nah, what's wrong with a horse?' That was a huge bet he made, and it worked."
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I would like to die on Mars. Just not on impact. "
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "I think that's the single best piece of advice: constantly think about how you could be doing things better and questioning yourself."
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "There's a silly notion that failure's not an option at NASA. Failure is an option here. If things are not failing, you are not innovating enough."
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "I'm interested in things that change the world or that affect the future and wondrous, new technology where you see it, and you're like, 'Wow, how did that even happen? How is that possible?'"
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "It's OK to have your eggs in one basket as long as you control what happens to that basket."
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "I don't create companies for the sake of creating companies, but to get things done."
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "When something is important enough, you do it even if the odds are not in your favor. "
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "We're going to make it happen. As God is my bloody witness, I'm hell-bent on making it work."
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "I think it is possible for ordinary people to choose to be extraordinary. "
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "I could either watch it happen or be a part of it."
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "We’re changing the world and changing history, and you either commit or you don’t"
        cats = ["Success"]
        moos = ["Motiviational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There's a tremendous bias against taking risks. Everyone is trying to optimize their ass-covering."
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don't think it's a good idea to plan to sell a company."
        cats = ["Entrepenuer"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "People work better when they know what the goal is and why. It is important that people look forward to coming to work in the morning and enjoy working."
        cats = ["Entrepenuer"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you're co-founder or CEO, you have to do all kinds of tasks you might not want to do... If you don't do your chores, the company won't succeed... No task is too menial."
        cats = ["Entrepenuer"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "My biggest mistake is probably weighing too much on someone's talent and not someone's personality. I think it matters whether someone has a good heart."
        cats = ["Entrepenuer"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Starting and growing a business is as much about the innovation, drive, and determination of the people behind it as the product they sell."
        cats = ["Entrepenuer"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The first step is to establish that something is possible; then probability will occur."
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
      
        text = "Really pay attention to negative feedback and solicit it, particularly from friends. ... Hardly anyone does that, and it's incredibly helpful."
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Being an entrepreneur is like eating glass and staring into the abyss of death."
        cats = ["Entrepenuer"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I wouldn't say I have a lack of fear. In fact, I'd like my fear emotion to be less because it's very distracting and fries my nervous system."
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think most of the important stuff on the Internet has been built. There will be continued innovation, for sure, but the great problems of the Internet have essentially been solved."
        cats = ["Entrepenuer", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When somebody has a breakthrough innovation, it is rarely one little thing. Very rarely, is it one little thing. It's usually a whole bunch of things that collectively amount to a huge innovation."
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
