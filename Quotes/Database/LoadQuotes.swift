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


var quoteIterator = 0

class LoadQuotes {
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
        quoteIterator += 1
        try! realm.write {
            realm.add(quote)
        }
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
        
        //Elon Musk
        name = "Elon Musk"
        
        text = "My mentality is that of a samurai. I would rather commit seppuku than fail."
        cats = ["Success", "Entrepreneur", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When I was in college, I wanted to be involved in things that would change the world."
        cats = ["Entrepreneur", "Change", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If there was a way I could not eat, so I could work more, I would not eat. I wish there was a way to get nutrients without sitting down for a meal."
        cats = ["Entrepreneur", "Change", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you get up in the morning and think the future is going to be better it is a bright day. Otherwise, it's not. "
        cats = ["Entrepreneur", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think it's very important to have a feedback loop, where you're constantly thinking about what you've done and how you could be doing it better. I think that's the single best piece of advice: constantly think about how you could be doing things better and questioning yourself."
        cats = ["Entrepreneur", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When Henry Ford made cheap, reliable cars people said, 'Nah, what's wrong with a horse?' That was a huge bet he made, and it worked."
        cats = ["Entrepreneur", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I would like to die on Mars. Just not on impact. "
        cats = ["Success", "Entrepreneur", "Motiviational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think that's the single best piece of advice: constantly think about how you could be doing things better and questioning yourself."
        cats = ["Success", "Entrepreneur", "Change", "Motiviational", "Hungry"]
        moos = ["Motiviational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There's a silly notion that failure's not an option at NASA. Failure is an option here. If things are not failing, you are not innovating enough."
        cats = ["Success", "Entrepreneur", "Change", "Motiviational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'm interested in things that change the world or that affect the future and wondrous, new technology where you see it, and you're like, 'Wow, how did that even happen? How is that possible?'"
        cats = ["Success", "Entrepreneur", "Motiviational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It's OK to have your eggs in one basket as long as you control what happens to that basket."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don't create companies for the sake of creating companies, but to get things done."
        cats = ["Success", "Entrepreneur", "Motiviational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When something is important enough, you do it even if the odds are not in your favor. "
        cats = ["Success", "Entrepreneur", "Motiviational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We're going to make it happen. As God is my bloody witness, I'm hell-bent on making it work."
        cats = ["Success", "Entrepreneur", "Motiviational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think it is possible for ordinary people to choose to be extraordinary. "
        cats = ["Success", "Entrepreneur", "Motiviational", "Hungry", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I could either watch it happen or be a part of it."
        cats = ["Success", "Entrepreneur", "Motiviational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We’re changing the world and changing history, and you either commit or you don’t"
        cats = ["Success", "Entrepreneur", "Motiviational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
            
        text = "I don't think it's a good idea to plan to sell a company."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "People work better when they know what the goal is and why. It is important that people look forward to coming to work in the morning and enjoy working."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you're co-founder or CEO, you have to do all kinds of tasks you might not want to do... If you don't do your chores, the company won't succeed... No task is too menial."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "My biggest mistake is probably weighing too much on someone's talent and not someone's personality. I think it matters whether someone has a good heart."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Starting and growing a business is as much about the innovation, drive, and determination of the people behind it as the product they sell."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The first step is to establish that something is possible; then probability will occur."
        cats = ["Entrepreneur", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
      
        text = "Really pay attention to negative feedback and solicit it, particularly from friends... Hardly anyone does that, and it's incredibly helpful."
        cats = ["Entrepreneur", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Being an entrepreneur is like eating glass and staring into the abyss of death."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I wouldn't say I have a lack of fear. In fact, I'd like my fear emotion to be less because it's very distracting and fries my nervous system."
        cats = ["Entrepreneur", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When somebody has a breakthrough innovation, it is rarely one little thing. Very rarely, is it one little thing. It's usually a whole bunch of things that collectively amount to a huge innovation."
        cats = ["Entrepreneur", "Change", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you need inspiring words, don't do it."
        cats = ["Entrepreneur", "Success", "Motivation", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You should take the approach that you're wrong. Your goal is to be less wrong."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Some people don’t like change, but you need to embrace change if the alternative is disaster."
        cats = ["Entrepreneur", "Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I take the position that I’m always to some degree wrong, and the aspiration is to be less wrong."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Persistence is very important. You should not give up unless you are forced to give up."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Starting and growing a business is as much about the innovation, drive, and determination of the people behind it as the product they sell."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)        
                
        text = "Talent is extremely important. It's like a sports team, the team that has the best individual player will often win, but then there's a multiplier from how those players work together and the strategy they employ."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)        
        
        text = "Work like hell. I mean you just have to put in 80 to 100 hour weeks every week. [This] improves the odds of success. If other people are putting in 40 hour workweeks and you're putting in 100 hour workweeks, then even if you're doing the same thing, you know that you will achieve in four months what it takes them a year to achieve."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)       
        
        text = "You shouldn't do things differently just because they're different. They need to be... better."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)     
        
        //Gary Vaynerchuck
        name = "Gary Vaynerchuck"
        
        text = "Skills are cheap. Passion is priceless."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Look yourself in the mirror and ask yourself: What do I want to do every day for the rest of my life? DO THAT"
        cats = ["Success", "Entrepreneur", "Change"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        /*text = "Complaining is a zero return investment."
        cats = ["Success", "Entrepreneur", "Change"]
        moos = ["Motivational"]
         MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)*/
        
        text = "I'm grinding when you're sleeping."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'm not worried about getting boo'd in the third quarter. Talk to me after the game."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "Doing it is the only option."
        cats = ["Success", "Entrepreneur", "Change"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "If you're not dreaming big for yourself, who's going to do it for you?"
        cats = ["Success", "Entrepreneur", "Change"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
                
        //Big Brandon Carter
        name = "Big Brandon Carter"
        
        text = "This is planet earth. Results are the only thing that matters on planet earth."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You got to take responsibility for your own success. Regardless of your circumstances."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Crying only works for babies."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                      
        text = "Men are expected to produce results. That's how you're going to be judged. On what you produce, or what you don't."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                              
        text = "Nobody is going to have pity on you."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                              
        text = "Don't worry about what he has. What do you have? What are you going to do to be successful? What are you going to do to accomplish your goals?"
        cats = ["Success", "Entrepreneur", "Fitness", "Change"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                              
        text = "Some people may have some advantages that you don't have. You may have to work harder than them... So work harder than them! If thats what it takes than thats what you do."
        cats = ["Success", "Entrepreneur", "Fitness", "Change"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                              
        text = "With every excuse you make, you're putting your weakness on display for the whole world to see."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Today I want you to promise yourself that you're done making excuses forever. You're done. You're going to set goals and you're going to accomplish them no matter what stands in your way.  "
        cats = ["Success", "Entrepreneur", "Fitness", "Change"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "No matter how many times you fall down, you're going to get back up. You're going to keep going. You're going to keep pushing. "
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "You have to have extreme actions to have extreme results."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Chill don't pay the bills."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
                
        //DJ Khaled
        name = "DJ Khaled"
        
        text = "They kick you when you’re down, but they wanna kick it when you’re up."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "You can never run out of keys."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Don’t ever play yourself."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "“You gotta water your plants. Nobody can water them for you.”"
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Stay focused and secure your bag, because they want you to fail and they don’t want us to win."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "We gonna win more. We gonna live more. We the best."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I’m gonna go hard no matter what because I gotta feed my family and I gotta feed myself."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "At the end of the day, I understand that life has road blocks, and life is like school - you'll be tested; we gotta pass it.."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "We all want to win more, but it's all about being blessed and embracing your blessings. We have life."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Key is never be afraid of being yourself. Never!"
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
 
        text = "I wake up every day inspiring myself, because God gave me life."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
       
        text = "I remember they used to tell me, they said, 'Khaled, you can't get a Rolls-Royce; you need to get one of them small ones.' So I went and bought a Phantom."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                         
        text = "People will try to bring you down, but you gotta go up."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I always make my dreams into goals."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                    
        text = "We can take a 'It was hard to get there.' But we ain't taking no loss. We're going to win."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                         
        text = "That's when you know you're the greatest: when you're the greatest, and people still put odds against you."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
    
        text = "They will try to close the door on you, just open it."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Those that weather the storm are the great ones."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "They don’t want you to win. They don’t want you to have the No. 1 record in the country. They don’t want you get healthy. They don’t want you to exercise. And they don’t want you to have that view."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We go hard. In everything we do we’re going to accomplish our victory and our goal. If it takes a day, a year, or 20 years, we’re going to win. I haven’t taken a loss because everything I’ve done has been a working process to win. From being a kid on them turntables to becoming where I am is not a loss. It’s a blessing."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        //Barack Obama
        name = "Barack Obama"
        
        text = "If you're walking down the right path and you're willing to keep walking, eventually you'll make progress."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Change will not come if we wait for some other person or some other time. We are the ones we've been waiting for. We are the change that we seek."
        cats = ["Success", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The future rewards those who press on. I don't have time to feel sorry for myself. I don't have time to complain. I'm going to press on. "
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Yes we can."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Focusing your life solely on making a buck shows a poverty of ambition. It asks too little of yourself, and it will leave you unfulfilled. "
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "You can't let your failures define you. You have to let your failures teach you."
        cats = ["Success", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
    
        text = "Where you are right now doesn't have to determine where you'll end up."
        cats = ["Success", "Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Change is never easy but always possible."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                      
        text = "While we breathe, we will hope. "
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "We don't ask you to believe in our ability to bring change, rather, we ask you to believe in yours. "
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "There is no excuse for not trying."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Nothing in life that's worth anything is easy."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
 
        text = "Progress will come in fits and starts. It's not always a straight line. It's not always a smooth path."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The cynics may be the loudest voices- but I promise you, they will accomplish the least."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "One voice can change a room."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "We need to internalize this idea of excellence. Not many folks spend a lot of time trying to be excellent."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "If you work hard and meet your responsibilities, you can get ahead, no matter where you come from, what you look like or who you love."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Making your mark on the world is hard. If it were easy, everybody would do it. But it's not. It takes patience, it takes commitment and it comes with plenty of failure along the way."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The best way to not feel hopeless is to get up and do something."
        cats = ["Success", "Change", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "We did not come here to fear the future. We came here to shape it."
        cats = ["Success", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "If you run you stand a chance of losing, but if you don't run you've already lost."
        cats = ["Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Our destiny is not written for us, but by us."
        cats = ["Success", "Change", "Motivational", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                  
        text = "Your voice can change the world."
        cats = ["Success", "Motivational", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
          
                
        //LeBron James
        name = "LeBron James"
        
        text = "When you become lazy, it's disrespectful to those who believe in you."
        cats = ["Success", "Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t be afraid of failure. This is the way to succeed."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I’m going to use all my tools, my God-given ability, and make the best life I can with it."
        cats = ["Success", "Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
         text = "Dream as if you’ll live forever. Live as if you’ll die today."
        cats = ["Success", "Sports", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
         text = "You can’t be afraid to fail. It’s the only way you succeed. You’re not gonna succeed all the time and I know that."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
         text = "I always say, decisions I make, I live with them. There’s always ways you can correct them or ways you can do them better. At the end of the day, I live with them."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
         text = "When you have that gut feeling, you have to go with it don’t go back on it."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I think the reason why I am who I am today is because I went through those tough times when I was younger."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I treated it like every day was my last day with a basketball."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "All your life you are told the things you cannot do. All your life they will say you’re not good enough or strong enough or talented enough. They will say you’re the wrong height or the wrong weight or the wrong type to play this or be this or achieve this. They will tell you no. A thousand times no. until all the no’s become meaningless. All your life they will tell you no. Quite firmly and very quickly. And you will tell them yes."
        cats = ["Success", "Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I like criticism. It makes you strong."
        cats = ["Success", "Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Ask me to play, I’ll play. Ask me to shoot, I’ll shoot. Ask me to pass, I’ll pass. Ask me to steal, block out, sacrifice, lead, dominate, anything. But it’s not just what you ask of me. It’s what I ask of myself."
        cats = ["Success", "Sports", "Motivational", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I hear my friends and my mom tell me I’m special, but honestly, I still don’t get it."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I hear that word pressure all the time. There is a lot of pressure put on me, but I don’t put a lot of pressure on myself. I feel if I play my game, it will take care of itself."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Every night on the court I give my all, and if I'm not giving 100 percent, I criticize myself."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "You know, when I have a bad game, it continues to humble me and know that, you know, you still have work to do and you still have a lot of people to impress."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        //J.K. Rowling
        name = "J.K. Rowling"
        
        text = "It is our choices... that show what we truly are, far more than our abilities."
        cats = ["Success","Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "It is impossible to live without failing at something, unless you live so cautiously that you might as well not have lived at all, in which case you have failed by default."
        cats = ["Success","Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Anything's possible if you've got enough nerve."
        cats = ["Success","Change"]
        moos = ["Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "What's coming will come and we'll just have to meet it when it does."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
         text = "It does not do to dwell on dreams and forget to live."
        cats = ["Success","Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "As is a tale, so is life: not how long it is, but how good it is, is what matters."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The knowledge that you have emerged wiser and stronger from setbacks means that you are, ever after, secure in your ability to survive."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "We do not need magic to change the world, we carry all the power we need inside ourselves already: we have the power to imagine better."
        cats = ["Change"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "You will never truly know yourself, or the strength of your relationships, until both have been tested by adversity."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "It matters not what someone is born, but what they grow to be."
        cats = ["Success","Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "You’ve got to work. It’s about structure. It’s about discipline. It’s all these deadly things that your schoolteacher told you you needed… You need it."
        cats = ["Success","Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Luck can only get you so far."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Wit beyond measure is a man's greatest treasure."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "It was strange how your brain could know what your heart refused to accept."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        //Beyonce
        name = "Beyonce"
        
        text = "If everything was perfect, you would never learn and you would never grow."
        cats = ["Success","Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Power means happiness; power means hard work and sacrifice."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "When you love and accept yourself, when you know who really cares about you, and when you learn from your mistakes, then you stop caring about what people who don't know you think."
        cats = ["Success","Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I can never be safe; I always try and go against the grain. As soon as I accomplish one thing, I just set a higher goal. That's how I've gotten to where I am."
        cats = ["Success"]
        moos = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I wanted to sell a million records, and I sold a million records. I wanted to go platinum; I went platinum. I've been working nonstop since I was 15. I don't even know how to chill out."
        cats = ["Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I get nervous when I don't get nervous. If I'm nervous I know I'm going to have a good show."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I truly believe that women should be financially independent from their men. And let’s face it, money gives men the power to run the show. It gives men the power to define value. They define what’s sexy. And men define what’s feminine. It’s ridiculous."
        cats = ["Success","Change", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I always try to be myself. Ever since I was an introverted kid, I’d get on stage and be able to break out of my shell."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I love my job, but it’s more than that: I need it."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Strong enough to bear the children. Then get back to business."
        cats = ["Success", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I don’t like to gamble, but if there’s one thing I’m willing to bet on, it’s myself."
        cats = ["Success", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The reality is, sometimes you lose."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
         //Conor Mcgregor
        name = "Conor McGregor"
        
        text = "Doubt is only removed by action. If you’re not working then that’s where doubt comes in."
        cats = ["Success", "Sports", "Motivational", "Hungry"]
        moos = ["Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There’s no talent here, this is hard work. This is an obsession. Talent does not exist, we are all equals as human beings. You could be anyone if you put in the time. You will reach the top, and that’s that. I am not talented, I am obsessed."
        cats = ["Success", "Sports","Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I have never encountered a winner that held hate towards something."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "It’s not really that much big of a deal – you brush it off and you come back. Defeat is the secret ingredient to success."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I’m just going to keep doing what I’m doing. Keep proving people wrong and proving myself right."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "At the end of the day, you’ve gotta feel some way. So why not feel unbeatable? Why not feel untouchable?"
        cats = ["Success", "Sports", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I keep having vivid dreams of success. Then it’s time to sleep."
        cats = ["Success", "Sports", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Failure is not an option for me. Success is all I envision."
        cats = ["Success", "Sports", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Excellence is not a skill. Excellence is an attitude."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I stay ready so I don’t have to get ready."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "All that matters is how you see yourself."
        cats = ["Success", "Sports", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Do I hate my opponents? How can I hate someone who has the same dreams as me?"
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I was always a dreamer, and my first ambition was to be a footballer. I’d be out in the field doing drills after it got dark at night. So I had that passion to get somewhere and a drive to do something. I did love football and was always more into playing it than watching it. When I found combat sport, however, it just took over. It’s non-stop now."
        cats = ["Success", "Sports", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "One king gets old, then a young gorilla comes up and kills him, and takes everything he owns."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Approach everything with an open mind, with a learning mind. You will never stop learning as long as you keep the mind-set that everything works, because everything does work. There’s a time and a place for every single move. If you work on it enough, it will work."
        cats = ["Success", "Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Be grateful with everything you have and you will be successful in everything you do."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "My success isn’t a result of arrogance. It’s a result of belief"
        cats = ["Success", "Sports", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Look out for those who look out for you. Loyalty is everything."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "There’s people that focus on the game and forget about the art. There’s that specific individual that can do both."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "You can’t fear success and I think a lot of people do. I think a lot of people fear the really high heights. But I am not one of those people… I’m not like that. I’m going for it."
        cats = ["Success", "Sports", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "We’re not just here to take part. We’re here to take over."
        cats = ["Success", "Sports", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
                
        //Thomas Jefferson
        name = "Thomas Jefferson"
        
        text = "Walking is the best possible exercise. Habituate yourself to walk very far."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The tree of liberty must be refreshed from time to time with the blood of patriots and tyrants."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "In matters of style, swim with the current; in matters of principle, stand like a rock."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Indeed, I tremble for my country when I reflect that God is just: that his justice cannot sleep forever."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When the people fear the government there is tyranny, when the government fears the people there is liberty.."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I cannot live without books."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I have sworn upon the altar of God, eternal hostility against every form of tyranny over the mind of man."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Honesty is the first chapter in the book of wisdom."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Question with boldness even the existence of a God; because, if there be one, he must more approve of the homage of reason, than that of blind-folded fear."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If a nation expects to be ignorant and free, in a state of civilization, it expects what never was and never will be."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Nothing can stop the man with the right mental attitude from achieving his goal; nothing on earth can help the man with the wrong mental attitude."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Do you want to know who you are? Don't ask. Act! Action will delineate and define you."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I like the dreams of the future better than the history of the past."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        
        text = "Our greatest happines does not depend on the condition of life in which chance has placed us, but is always the result of a good conscience, good health, occupation, and freedom in all just pursuits."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Never spend your money before you have earned it."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                 
        text = "I believe that every human mind feels pleasure in doing good to another."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "When angry count to ten before you speak. If very angry, count to one hundred."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
              
        text = "Whenever you do a thing, act as if all the world were watching."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)   
                
        text = "It is neither wealth nor splendor; but tranquility and occupation which give you happiness."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)   
                
        text = "Timid men prefer the calm of despotism to the tempestuous sea of liberty."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "One man with courage is a majority."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It is always better to have no ideas than false ones; to believe nothing; than to believe what is wrong."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Determine never to be idle. No person will have occasion to complain of the want of time who never loses any. It is wonderful how much may be done if we are always doing."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Advertisements contain the only truths to be relied on in a newspaper."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Enlighten the people generally, and tyranny and oppressions of body and mind will vanish like evil spirits at the dawn of day."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "He who knows best knows how little he knows."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don't talk about what you have done or what you are going to do."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "My theory has always been, that if we are to dream, the flatteries of hope are as cheap, and pleasanter, than the gloom of despair."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Grant Cardone
        name = "Grant Cardone"
        
        text = "Successful people never blame others for their performance."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success tends to spend the most time with those that pay it the most attention."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I never trusted my talent, so I outworked everyone."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you can handle fear, you can handle success."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I want a million dollars in my happy account and a million dollars in my bank account."
        cats = ["Entrepreneur", "Success", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "When distracted by events outside your control recommit to those things which you can control."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "A little attention with massive action goes a long way"
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "As long as you are alive, you will either live to accomplish your own goals and dreams or be used as a resource to accomplish someone else's."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Whatever you think it’s going to take multiply times 10."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Successful people show up early and stay late"
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you want to be in the 1% it’s simple, don’t do what the 99% do."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A quitter is anyone that settles."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You will never create a powerful, solvent, prosperous, and abundant economy with an attitude of arrogance."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you don't know why, you will never know how."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Tough times never last, but tough people do."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Self confidence is the only outfit you can't buy. You must develop it."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Do what you are scared to do and watch your confidence grow."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        
        //Michael Jordan
        name = "Michael Jordan"
        
        text = "You must expect great things of yourself before you can do them."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Talent wins games, but teamwork and intelligence wins championships."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I've missed more than 9000 shots in my career. I've lost almost 300 games. 26 times, I've been trusted to take the game winning shot and missed. I've failed over and over and over again in my life. And that is why I succeed."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I can accept failure, everyone fails at something. But I can't accept not trying."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Just play. Have fun. Enjoy the game."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
              
        text = "Some people want it to happen, some wish it would happen, others make it happen."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)   
                
        text = "I've failed over and over and over again in my life and that is why I succeed."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
             
        text = "Obstacles don't have to stop you. If you run into a wall, don't turn around and give up. Figure out how to climb it, go through it, or work around it."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The game has its ups and downs, but you can never lose focus of your individual goals and you can't let yourself be beat because of lack of effort."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Limits, like fear, is often an illusion."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Always turn a negative situation into a positive situation."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I've always believed that if you put in the work, the results will come."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)  
                
        text = "You have competition every day because you set such high standards for yourself that you have to go out every day and live up to that."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "My attitude is that if you push me towards something that you think is a weakness, then I will turn that perceived weakness into a strength."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "To be successful you have to be selfish, or else you never achieve. And once you get to your highest level, then you have to be unselfish. Stay reachable. Stay in touch. Don't isolate."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Sometimes, things may not go your way, but the effort should be there every single night."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos) 
                
        text = "There is no 'i' in team but there is in win."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "My father used to say that it's never too late to do anything you wanted to do. And he said, 'You never know what you can accomplish until you try.'"
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "If you accept the expectations of others, especially negative ones, then you never will change the outcome."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I've never been afraid to fail."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)        

        text = "When I was young, I had to learn the fundamentals of basketball. You can have all the physical ability in the world, but you still have to know the fundamentals."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Winning isn't always championships."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I'm patient."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "There's only one Michael Jordan."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)        
        
        text = "I'm not out there sweating for three hours every day just to find out what it feels like to sweat."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I want to be perceived as a guy who played his best in all facets, not just scoring. A guy who loved challenges."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Muhammad Ali
        name = "Muhammad Ali"
        
        text = "I'm young; I'm handsome; I'm fast. I can't possibly be beat."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t count the days; make the days count."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If my mind can conceive it, and my heart can believe it—then I can achieve it."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It's hard to be humble when you're as great as I am."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It isn’t the mountains ahead to climb that wear you out; it’s the pebble in your shoe."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you even dream of beating me you'd better wake up and apologize."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Braggin' is when a person says something and can’t do it. I do what I say."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I am the greatest, I said that even before I knew I was."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Only a man who knows what it is like to be defeated can reach down to the bottom of his soul and come up with the extra ounce of power it takes to win when the match is even."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'm so mean, I make medicine sick."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I should be a postage stamp. That's the only way I'll ever get licked."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Impossible is just a big word thrown around by small men who find it easier to live in the world they’ve been given than to explore the power they have to change it. Impossible is not a fact. It’s an opinion. Impossible is not a declaration. It’s a dare. Impossible is potential. Impossible is temporary. Impossible is nothing."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "He who is not courageous enough to take risks will accomplish nothing in life."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A man who views the world the same at 50 as he did at 20 has wasted 30 years of his life."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If they can make penicillin out of moldy bread, they can sure make something out of you."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I hated every minute of training, but I said, ‘Don’t quit. Suffer now and live the rest of your life as a champion."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "At home I am a nice guy: but I don’t want the world to know. Humble people, I’ve found, don’t get very far."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A man who has no imagination has no wings."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I am the astronaut of boxing. Joe Louis and Dempsey were just jet pilots. I'm in a world of my own."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’ve wrestled with alligators. I’ve tussled with a whale. I done handcuffed lightning. And throw thunder in jail."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s not bragging if you can back it up."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'm the most recognized and loved man that ever lived cuz there weren't no satellites when Jesus and Moses were around, so people far away in the villages didn't know about them."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’m not the greatest, I’m the double greatest."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Live everyday as if it were your last because someday you're going to be right."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I hated every minute of training, but I said, 'Don't quit. Suffer now and live the rest of your life as a champion.'"
        cats = ["Sports", "Success", "Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Old age is just a record of one's whole life."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life is a gamble. You can get hurt, but people die in plane crashes, lose their arms and legs in car accidents; people die every day. Same with fighters: some die, some get hurt, some go on. You just don't let yourself believe it will happen to you."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "No one knows what to say in the loser's locker room."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I figured that if I said it enough, I would convince the world that I really was the greatest."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'm so fast that last night I turned off the light switch in my hotel room and was in bed before the room was dark."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
   
        //Steve Jobs
        name = "Steve Jobs"
          
        text = "You can't connect the dots looking forward; you can only connect them looking backward. So you have to trust that the dots will somehow connect in your future. You have to trust in something--your gut, destiny, life and karma, whatever. This approach has never let me down, and it has made all the difference in my life."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Here's to the crazy ones, the misfits, the rebels, the troublemakers, the round pegs in the square holes.... The ones who see things differently--they're not fond of rules.... You can quote them, disagree with them, glorify or vilify them, but the only thing you can't do is ignore them because they change things.... They push the human race forward, and while some may see them as the crazy ones, we see genius, because the ones who are crazy enough to think that they can change the world are the ones who do."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Innovation distinguishes between a leader and a follower."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "My favorite things in life don’t cost any money. It’s really clear that the most precious resource we all have is time."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Remembering that you are going to die is the best way I know to avoid the trap of thinking you have something to lose. You are already naked. There is no reason not to follow your heart."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Being the richest man in the cemetery doesn’t matter to me. Going to bed at night saying we’ve done something wonderful, that’s what matters to me."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you really look closely, most overnight successes took a long time."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you don’t love something, you’re not going to go the extra mile, work the extra weekend, challenge the status quo as much."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Quality is much better than quantity. One home run is much better than two doubles."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
       
        //Arnold Schwarzenegger
        name = "Arnold Schwarzenegger"
        
        text = "The last three or four reps is what makes the muscle grow. This area of pain divides the champion from someone else who is not a champion. That's what most people lack, having the guts to go on and just say they'll go through the pain no matter what happens."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Bodybuilding is much like any other sport. To be successful, you must dedicate yourself 100% to your training, diet and mental approach."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "What we face may look insurmountable. But I learned something from all those years of training and competing. I learned something from all those sets and reps when I didn't think I could lift another ounce of weight. What I learned is that we are always stronger than we know."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The resistance that you fight physically in the gym and the resistance that you fight in life can only build a strong character."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "What I’m doing is the thing I want to do. I don’t care what other people think."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Just like in bodybuilding, failure is also a necessary experience for growth in our own lives, for if we're never tested to our limits, how will we know how strong we really are? How will we ever grow?"
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "What helps me is to think of this pain as pleasure. Pain makes me grow. Growing is what I want. Therefore, for me pain is pleasure."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Strength does not come from winning. Your struggles develop your strengths. When you go through hardships and decide not to surrender, that is strength."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Failure is not an option. Everyone has to succeed."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The mind is the limit. As long as the mind can envision the fact that you can do something, you can do it, as long as you really believe 100 percent."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "For me life is continuously being hungry. The meaning of life is not simply to exist, to survive, but to move ahead, to go up, to achieve, to conquer."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "As a kid I always idolized the winning athletes. It is one thing to idolize heroes. It is quite another to visualize yourself in their place. When I saw great people, I said to myself: I can be there."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Well, you know, I'm the forever optimist."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We all have great inner power. The power is self-faith. There's really an attitude to winning. You have to see yourself winning before you win. And you have to be hungry. You have to want to conquer."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "My instinct was to win, eliminate anyone who is in competition, destroy my enemy, and move on without any kind of hesitation at all."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you go through hardships and decide not to surrender, that is strength."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Stop whining."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Stay hungry, stay healthy, be a gentleman, believe strongly in yourself and go beyond limitations."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Good things don’t happen by coincidence. Every dream carries with it certain risks, especially the risk of failure. But I am not stopped by risks. Supposed a great person takes the risk and fails. Then the person must try again. You cannot fail forever. If you try ten times, you have a better chance of making it on the eleventh try than if you didn’t try at all."
        cats = ["Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Oprah Winfrey
        name = "Oprah Winfrey"
        
        text = "When you undervalue what you do, the world will undervalue who you are."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Doing the best at this moment puts you in the best place for the next moment"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Be thankful for what you have; you’ll end up having more. If you concentrate on what you don’t have, you will never, ever have enough."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Turn your wounds into wisdom."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You can have it all. Just not all at once."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Challenges are gifts that force us to search for a new center of gravity. Don’t fight them. Just find a new way to stand."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The thing you fear most has no power. Your fear of it is what has the power. Facing the truth really will set you free."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Surround yourself only with people who are going to take you higher."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You don’t become what you want, you become what you believe."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The great courageous act that we must all do, is to have the courage to step out of our history and past so that we can live our dreams."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Everyone wants to ride with you in the limo, but what you want is someone who will take the bus with you when the limo breaks down."
        cats = ["Success", "Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Do the one thing you think you cannot do. Fail at it. Try again. Do better the second time. The only people who never tumble are those who never mount the high wire."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You get in life what you have the courage to ask for."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The more you praise and celebrate your life, the more there is in life to celebrate."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Everybody has a calling. And your real job in life is to figure out as soon as possible what that is, who you were meant to be, and to begin to honor that in the best way possible for yourself."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The key to realizing a dream is to focus not on success but on significance — and then even the small steps and little victories along your path will take on greater meaning."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Tom Brady
        name = "Tom Brady"
        
        text = "I just love working hard. I love being part of a team; I love working toward a common goal."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The true competitors, though, are the ones who always play to win."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "To me, football is so much about mental toughness, it's digging deep, it's doing whatever you need to do to help a team win and that comes in a lot of shapes and forms."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you're one of the leaders of the team, there are no days off."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'm not a person who defends myself very often. I kind of let my actions speak for me."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I was the kid that was the 199th pick that never had the body for it. People didn't think I'd play for one year in the NFL, and now I'm going on my 17th year."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You have to believe in your process. You have to believe in the things you are doing to help the team win. I think you have to take the good with the bad. "
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
              
        text = "A lot of times I find that people who are blessed with the most talked don't ever develop that attitude, and the ones who aren't blessed in that way are the most competitive and have the biggest heatrt."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It's our responsibility to do the best we can do to change things we don't like. I think that's part of social responsibility, and everybody is going to do that in their own way."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
              
        text = "If I have something to say, I want it to be meaningful."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
             
        text = "I firmly believe that sleep and recovery are critical aspects of an effective and holistic training program."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
              
        text = "Maybe some people can wake up and play PlayStation all day, but that's never been me."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You get one life, so you should enjoy it."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I have a memory, and I can just eliminate mistakes when they come up because I've already made them."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don't want to wake up and be bored. That's probably my greatest fear is to have nothing to do."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You want to know which ring is my favorite? The next one."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you don't believe in yourself why is anyone else going to believe in you?"
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I didn't come this far to only come this far, so we've still got further to go."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         //Will Smith   
        name = "Will Smith"
        
        text = "The only thing that I see that is distinctly different about me is I'm not afraid to die on a treadmill. I will not be out-worked, period. You might have more talent than me, you might be smarter than me, you might be sexier than me, you might be all of those things you got it on me in nine categories. But if we get on the treadmill together, there's two things: You're getting off first, or I'm going to die. It's really that simple, right?"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Being realistic is the most commonly traveled road to mediocrity."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Money and success don’t change people; they merely amplify what is already there."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Stop letting people who do so little for you control so much of your mind, feelings and emotions."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t chase people. Be yourself, do your own thing and work hard. The right people – the ones who really belong in your life – will come to you. And stay."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The separation of talent and skill is one of the greatest misunderstood concepts for people who are trying to excel, who have dreams, who want to do things. Talent you have naturally. Skill is only developed by hours and hours and hours of beating on your craft."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Greatness is not this wonderful, esoteric, elusive, godlike feature that only the special among us will ever taste, it’s something that truly exists in all of us."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you’re not making someone else’s life better, then you’re wasting your time. Your life will become better by making other people’s lives better"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Fear is not real. The only place that fear can exist is in our thoughts of the future. It is a product of our imagination, causing us to fear things that do not at present and may not ever exist… Do not misunderstand me danger is very real but fear is a choice."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I want to be the person that is the first person there and the last person to leave. That’s who I want to be, because I think the road to success is through commitment, and through the strength to drive through that commitment when it gets hard. And it is going to get hard and you’re going to want to quit sometimes, but it’ll be colored by who you are, and more by who you want to be."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never lie, steal, cheat, or drink. But if you must lie, lie in the arms of the one you love. If you must steal, steal away from bad company. If you must cheat, cheat death. And if you must drink, drink in the moments that take your breath away"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Too many people spend money they haven’t earned, to buy things they don’t want, to impress people they don’t like."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There’s no reason to have a plan B because it distracts from plan A."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you’re running and you are there, there’s a little person that talks to you and that little person says “Oh, I’m tired”, “My lung’s about to pop”, “I’m so hurt”, “I’m so tired”, “There’s no way I can possibly continue”. And you wanna quit. Right? That person, if you learn how to defeat that person when you’re running you will learn how to not quit when things get hard in your life."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I've always considered myself to be just average talent and what I have is a ridiculous insane obsessiveness for practice and preparation."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you’re not willing to work hard, let someone else do it. I’d rather be with someone who does a horrible job, but gives 110% than with someone who does a good job and gives 60%."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The first step is you have to say that you can."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I wake up every morning believing today is going to be better than yesterday."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "99% is the same as zero. If you are gonna do 99, go ahead and stay home."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)                
      
        text = "If you want something, go get it. Period."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                        
        text = "And where I excel is ridiculous, sickening, work ethic. You know, while the other guy's sleeping? I'm working."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you don't fight for what you want, don't cry for what you lost."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don't know what my calling is, but I want to be here for a bigger reason. I strive to be like the greatest people who have ever lived."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "Fear is not real. Fear is a choice."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "I want to represent the idea that you really can make what you want. I believe I can create whatever I want to create."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
 //Dwayne "The Rock" Johnson
        name = "Dwayne \"The Rock\" Johnson"
        
        text = "Success isn't always about 'Greatness', it's about consistency. Consistent, hard work gains success. Greatness will come."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Blood, Sweat and Respect. First two you give, last one you earn."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "1995. 7 bucks in my pocket. I knew two things: I'm broke as hell and one day I won't be. "
        cats = ["Change", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I like to use the hard times in the past to motivate me today."
        cats = ["Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'll never, ever be full. I'll always be hungry. Obviously, I'm not talking about food. Growing up, I had nothing for such a long time. Someone told me a long time ago, and I've never forgotten it. 'Once you've ever been hungry, really, really hungry, then you'll never, ever be full.'"
        cats = ["Hungry", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The road to success and greatness is always paved with consistent hard work. Outwork your competitors, be authentic and above all else.. chase your greatness."
        cats = ["Motivational", "Success", "Change", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Let actions do your talking for you."
        cats = ["Motivational", "Success", "Fitness", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "With drive and a bit of talent, you can move mountains."
        cats = ["Motivational", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success at anything will always come down to this: focus and effort and we control both."
        cats = ["Success", "Motivational", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "All successes begin with Self-Discipline. It starts with you."
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t be afraid to be ambitious about your goals. Hard work never stops. Neither should your dreams."
        cats = ["Hungry", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We do today what they won’t so tomorrow we can accomplish what they can’t."
        cats = ["Success", "Fitness", "Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You don’t need directions, just point yourself to the top and go!"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When life puts you in tough situations, don’t say ‘why me?’ just say ‘Try Me’."
        cats = ["Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Think back 5 years ago. Think of where you’re at today. Think ahead 5 years and what you want to accomplish. Be unstoppable."
        cats = ["Change", "Fitness", "Sports", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Wake up determined. Go to bed satisfied."
        cats = ["Hungry", "Success", "Entrepreneur", "Fitness", "Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success isn’t overnight. It’s when everyday you get a little better than the day before. It all adds up."
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Grind hard, shine hard."
        cats = ["Success", "Fitness", "Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If something stands between you and your success, MOVE IT! Never be denied."
        cats = ["Success", "Change", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The first step to achiving your goal, is to take a moment to respect your goal. Know what it means to you to achieve it."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There is no substitute for hard work. Always be humble and hungry."
        cats = ["Hungry", "Success", "Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The wall! Your success is on the other side. Can’t jump over it or go around it. You know what to do."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Albert Einstein
        name = "Albert Einstein"
        
        text = "Try not to become a man of success, but rather try to become a man of value."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "In the middle of difficulty lies opportunity."
        cats = ["Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A person who never made a mistake never tried anything new."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life is like riding a bicycle. To keep your balance you must keep moving."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Great spirits have always encountered violent opposition from mediocre minds."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s not that I am so smart, it’s just that I stay with problems longer."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Insanity is doing the same thing, over and over again, but expecting different results."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Logic will get you from A to B. Imagination will take you everywhere."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You have to learn the rules of the game. And then you have to play better than anyone else"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We cannot solve our problems with the same thinking we used when we created them."
        cats = ["Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Few are those who see with their own eyes and feel with their own hearts."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Not everything that can be counted counts, and not everything that counts can be counted."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Everybody is a genius. But if you judge a fish by its ability to climb a tree, it will live its whole life believing that it is stupid."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Any intelligent fool can make things bigger and more complex… It takes a touch of genius – and a lot of courage to move in the opposite direction."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There are only two ways to live your life. One is as though nothing is a miracle. The other is as though everything is a miracle."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I am thankful for all of those who said NO to me. Its because of them I’m doing it myself."
        cats = ["Motivational", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never give up on what you really want to do. The person with big dreams is more powerful than the one with all the facts."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        //Stephen Hawking
        name = "Stephen Hawking"        
        
        text = "However difficult life may seem, there is always something you can do, and succeed at. It matters that you don’t just give up."
        cats = ["Motivational", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Without imperfection, you or I would not exist."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The thing about smart people is that they seem like crazy people to dumb people."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Try to make sense of what you see and wonder about what makes the universe exist. Be curious, and however difficult life may seem, there is always something you can do, and succeed at. It matters that you don’t just give up."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Quiet people have the loudest minds."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We are just an advanced breed of monkeys on a minor planet of a very average star. But we can understand the Universe. That makes us something very special."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Intelligence is the ability to adapt to change."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Although I cannot move and I have to speak through a computer, in my mind I am free."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Look up at the stars and not down at your feet. Try to make sense of what you see, and wonder about what makes the universe exist. Be curious."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The past, like the future, is indefinite and exists only as a spectrum of possibilities."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I am just a child who has never grown up. I still keep asking these 'how' and 'why' questions."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I believe things cannot make themselves impossible."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I was never top of the class at school, but my classmates must have seen potential in me, because my nickname was 'Einstein.'"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When one's expectations are reduced to zero, one really appreciates everything one does have."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Obviously, because of my disability, I need assistance. But I have always tried to overcome the limitations of my condition and lead as full a life as possible. I have traveled the world, from the Antarctic to zero gravity."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I have so much that I want to do. I hate wasting time."
        cats = ["Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "It is no good getting furious if you get stuck. What I do is keep thinking about the problem but work on something else. Sometimes it is years before I see the way forward. In the case of information loss and black holes, it was 29 years."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The doctor who diagnosed me with ALS, or motor neuron disease, told me that it would kill me in two or three years."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Floyd Mayweather
        name = "Floyd Mayweather"
        
        text = "A true champion will fight through anything."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A true champion can adapt to anything."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You have good days, you have bad days. But the main thing is to grow mentally."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you're the best, you only want to surround yourself with the best."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'm not in this sport to say a guy can beat me."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Everything people say I couldn't do I've done."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Worry about going out there and making your own legacy."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I come from a very rough background, and I'm saying that if you work hard and dedicate yourself that you can make it, too."
        cats = ["Sports", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You name him. I beat him."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'm always focused."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I am the best. There is nobody better than me."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don’t fold under pressure, great athletes perform better under pressure…so put pressure on me."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Showing is better than telling."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Some pay to see me win, some pay to see me lose, but they all pay."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Wayne Gretzky
        name = "Wayne Gretzky"
        
        text = "A good hockey player plays where the puck is. A great hockey player plays where the puck is going to be."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You miss 100% of the shots you don't take."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Procrastination is one of the most common and deadliest of diseases antd its toll on success and happiness is heavy."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The highest compliment that you can pay me is to say that I work hard every day, that I never dog it."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The only way a kid is going to practice is if it's total fun for him... and it was for me."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you win, say nothing, when you lose say less."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "No matter who you are, we're creatures of habit. The better your habits are, the better they will be in pressure situations."
        cats = ["Sports", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Emma Watson
        name = "Emma Watson"
        
        text = "It’s a journey and the sad thing is you only learn from experience, so as much as someone can tell you things, you have to go out there and make your own mistakes in order to learn."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The less you reveal, the more people can wonder."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If we stop defining each other by what we are not and start defining ourselves by what we are, we can all be freer."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s not the absence of fear. It’s overcoming it. Sometimes you’ve got to blast through and have faith."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you truly pour your heart into what you believe in, even if it makes you vulnerable, amazing things can and will happen."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t let anyone tell you what you can and can’t do or achieve. Do what you want to do and be who you want to be."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don't want other people to decide who I am. I want to decide that for myself."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "All I can do is follow my instincts, because I'll never please everyone."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don't want the fear of failure to stop me from doing what I really care about."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It sounds like a cliche but I also learnt that you're not going to fall for the right person until you really love yourself and feel good about how you are."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'm going to do what I want to do. I'm going to be who I really am. I'm going to figure out what that is."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I've always been like that; I give 100 percent. I can't do it any other way."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "What gets scary is when your self-worth is tied up in what strangers think of you."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t feel stupid if you don’t like what everyone else pretends to love."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Maya Angelou
        name = "Maya Angelou"
        
        text = "I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You may not control all the events that happen to you, but you can decide not to be reduced by them."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We delight in the beauty of the butterfly, but rarely admit the changes it has gone through to achieve that beauty."
        cats = ["Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’ve learned that whenever I decide something with an open heart, I usually make the right decision."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You can only become truly accomplished at something you love."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you don’t like something, change it. If you can’t change it, change your attitude."
        cats = ["Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We need much less than we think we need."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If I am not good to myself, how can I expect anyone else to be good to me?"
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Without courage we cannot practice any other virtue with consistency. We can’t be kind, true, merciful, generous, or honest."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’ve learned that even when I have pains, I don’t have to be one."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Have enough courage to trust love one more time and always one more time."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you’re always trying to be normal you will never know how amazing you can be."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Seek patience and passion in equal amounts. Patience alone will not build the temple. Passion alone will destroy its walls."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never make someone a priority when all you are to them is an option."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A wise woman wishes to be no one’s enemy; a wise woman refuses to be anyone’s victim."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life is not measured by the number of breaths you take but by the moments that take your breath away."
        cats = ["Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If one is lucky, a solitary fantasy can totally transform one million realities."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Hate, it has caused a lot of problems in the world, but has not solved one yet."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success is liking yourself, liking what you do, and liking how you do it."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’ve learned that you shouldn’t go through life with a catcher’s mitt on both hands; you need to be able to throw something back."
        cats = ["Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When someone shows you who they are, believe them the first time."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We are only as blind as we want to be."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I got my own back."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There is no greater agony than bearing an untold story inside you."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I respect myself and insist upon it from everybody. And because I do it, I then respect everybody, too."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I work very hard, and I play very hard. I’m grateful for life. And I live it – I believe life loves the liver of it. I live it."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Whatever you want to do, if you want to be great at it, you have to love it and be able to make sacrifices for it."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Mark Twain
        name = "Mark Twain"
        
        text = "Courage is resistance to fear, mastery of fear - not the absence of fear"
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The secret of getting ahead is getting started."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Kindness is the language which the deaf can hear and the blind can see."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "All you need in this life is ignorance and confidence, and then success is sure."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It's not the size of the dog in the fight, it's the size of the fight in the dog."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Age is an issue of mind over matter. If you don't mind, it doesn't matter."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Twenty years from now you will be more disappointed by the things that you didn't do than by the ones you did do. So throw off the bowlines. Sail the safe harbor. Catch the trade winds in your sail."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When all else fails, write what your heart tells you. You can't depend on your eyes when your imagination is out of focus."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Explore. Dream. Discover."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I do not fear death. I had been dead for billions and billions of years before I was born, and had not suffered the slightest inconvenience from it."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Give every day the chance to become the most beautiful of your life. "
        cats = ["Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Continuous improvement is better than delayed perfection."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life is short. Break the rules. Forgive quickly. Kiss slowly. Love truly. Laugh uncontrollably and never regret anything that makes you smile. "
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The world owes you nothing. It was here first."
        cats = ["Hungry", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Do something every day that you don't want to do. This is the golden rule for acquiring the habit of doing your duty without pain. "
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
   
        //Jackie Chan
        name = "Jackie Chan"
        
        text = "Don’t try to be like Jackie. There is only one Jackie."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Do not let circumstances control you. You change your circumstances."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The best fights are the ones we avoid."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Cinema reflects culture and there is no harm in adapting technology, but not at the cost of losing your originality."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Now I am older, I understand we have to accept who we are."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Being still and doing nothing are two completely different things."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "A lot of people ask me when I do a stunt, ‘Jackie, are you scared?’ Of course I’m scared. I’m not Superman."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "I’m good for some things, bad for a lot of things."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "I do small things. I try to do good things every day. If everyone does some good, think of what a good world this will be."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Family is not who’s blood is in you, it’s who you love and who loves you."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Most of the time, I’m not even working; I’m just helping people, because I feel that I am too lucky."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Sometimes it takes only one act of kindness and caring to change a person’s life."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I only want my work to make people happy."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        //Dr. Seuss
        name = "Dr. Seuss"
        
        text = "Don't cry because it's over, smile because it happened."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You know you're in love when you can't fall asleep because reality is finally better than your dreams."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I like nonsense, it wakes up the brain cells. Fantasy is a necessary ingredient in living."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose. You're on your own. And you know what you know. And YOU are the one who'll decide where to go..."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sometimes the questions are complicated and the answers are simple."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Today you are You, that is truer than true. There is no one alive who is Youer than You."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The more that you read, the more things you will know. The more that you learn, the more places you'll go."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Why fit in when you were born to stand out?"
        cats = ["Success", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You're off to Great Places! Today is your day! Your mountain is waiting, So... get on your way!"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Today was good. Today was fun. Tomorrow is another one."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If things start happening, don't worry, don't stew, just go right along and you'll start happening too."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "All alone! Whether you like it or not, alone is something you'll be quite a lot!"
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Only you can control your future."
        cats = ["Empowerment", "Hungry", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You’ll miss the best things if you keep your eyes shut."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You can get help from teachers, but you are going to have to learn a lot by yourself, sitting alone in a room."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Think and wonder, wonder and think."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "To the world you may be one person; but to one person you may be the world."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It's not about what it is, it's about what it can become."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When he worked, he really worked. But when he played, he really PLAYED."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Matthew McConaughey
        name = "Matthew McConaughey"
        
        text = "You want to be a writer? Start writing. You want to be a filmmaker? Start shooting stuff on your phone right now."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "“If I’m doing something, I do like to take it to the limit. I’ve got a high ceiling. A wide threshold for seeing what those boundaries are for myself. I’m very resilient inside. I find things that I like and do and boy, I do like to stick to them."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’m a fan of the word selfish. Self. Ish. When I say I have gotten a lot more self-ish, I mean I am less concerned with what people think of me. I’m not worried about how I’m perceived. Selfish has always gotten a bad rap. You should do for you."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I believe in living in the present and making each day count. I don’t pay much attention to the past or the future."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The best education I’ve had in my life is to travel."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life is not fair, it never was and it is now and it won’t ever be. Do not fall into the trap. The entitlement trap, of feeling like you’re a victim. You are not."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life is a series of commas, not periods."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Give thanks. Appreciate what you DO have … the more we give thanks, the more we receive to be thankful for. Gratitude is the gift that always gives back."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s a scientific fact that gratitude reciprocates."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don’t want to just revolve. I want to evolve. As a man, as a human, as a father, as a lover."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Every hero doesn’t do this great big hero thing. They do the simple thing over and over… and they stick to it."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There are three things, to my account, that I need each day. One of them is something to look up to, another is something to look forward to, and another is someone to chase."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life’s barely long enough to get good at one thing. So be careful what you get good at."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "’So, are you a hero?’ And I was like, ‘not even close. No, no, no.’ She said, ‘Why?’ I said, ‘Because my hero’s me at 35.’ So you see every day, every week, every month and every year of my life, my hero’s always 10 years away. I’m never gonna be my hero. I’m not gonna attain that. I know I’m not, and that’s just fine with me because that keeps me with somebody to keep on chasing."
        cats = ["Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life is not a popularity contest. Take the hill, but first answer the question: What is my hill?"
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Morgan Freeman
        name = "Morgan Freeman"
        
        text = "Learning how to be still, to really be still and let life happen – that stillness becomes a radiance"
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I always tell my kids if you lay down, people will step over you. But if you keep scrambling, if you keep going, someone will always, always give you a hand. Always. But you gotta keep dancing, you gotta keep your feet moving."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The best way to guarantee a loss is to quit."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I can say that life is good to me. Has been and is good. So I think my task is to be good to it. So how do you be good to life? You live it."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If your life turns out to be good and you have a tremendous amount of luck in your life, it’s a good thing to turn around and make it work for others."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’m not intimidated by lead roles. I’m better in them. I don’t feel pressure. I feel released at times like that. That’s what I’m born to do."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I have to remind myself that some birds aren’t meant to be caged. Their feathers are just too bright. And when they fly away, the part of you that knows it was a sin to lock them up does rejoice."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you wake up and the snow is knee-deep outside, you are not filled with rage. It’s just something that you’ve got to cope with. If you’re living in a situation it’s the only situation that you know, and you’ve got to deal with it."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you want to see a miracle, be the miracle."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you live a life of make-believe, your life isn’t worth anything until you do something that does challenge your reality."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We humans are more concerned with having than with being."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "How do we change the world? One random act of kindness at a time."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never let pride be your guiding principle. Let your accomplishments speak for you."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "One of the things you can always depend on – this is one of the truths of the universe, and you heard it first from here – whatever we decide we want to do is what we do."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Very often, you know, you stop walking because you say, ‘Well, I’m tired of climbing this hill. I’m never going to get to the top.’ And you’re only two steps from the top."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t be different just for different’s sake. If you see it differently, function that way. Follow your own muse, always."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "As long as you feel like a victim, you are one."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t be afraid of what you want. This is your time. The barriers are down."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Get busy livin’ or get busy dyin’."
        cats = ["Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You can’t take credit for talent; you can only take credit for using it."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
       
        //Michelle Obama
        name = "Michelle Obama"
        
        text = "There are still many causes worth sacrificing for, so much history yet to be made."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If my future were determined just by my performance on a standardized test, I wouldn't be here. I guarantee you that."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Whether you come from a council estate or a country estate, your success will be determined by your own confidence and fortitude."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You may not always have a comfortable life and you will not always be able to solve all of the world's problems at once but don't ever underestimate the importance you can have because history has shown us that courage can be contagious and hope can take on a life of its own."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We learned about honesty and integrity- that the truth matters... that you don't take shortcuts or play by your own set of rules... and success doesn't count unless you earn it fair and square"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "One of the lessons that I grew up with was to always stay true to yourself and never let what somebody else says distract you from your goals."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You can't make decisions based on fear and the possibility of what might happen."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success is only meaningful and enjoyable if it feels like your own."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When I hear about negative and false attacks, I really don't invest any energy in them, because I know who I am."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We learned about dignity and decency - that how hard you work matters more than how much you make... that helping others means more than just getting ahead yourself."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Find people who will make you better."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We learned about gratitude and humility - that so many people had a hand in our success, from the teachers who inspired us to the janitors who kept our school clean... and we were taught to value everyone's contribution and treat everyone with respect."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Choose people who lift you up."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I am an example of what is possible when girls from the very beginning of their lives are loved and nurtured by people around them. I was surrounded by extraordinary women in my life who taught me about quiet strength and dignity."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When I get up and work out, I'm working out just as much for my girls as I am for me, because I want them to see a mother who loves them dearly, who invests in them, but who also invests in herself. It's just as much about letting them know as young women that it is okay to put yourself a little higher on your priority list."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "At the end of the day, when it comes time to make that decision, as president, all you have to guide you are your values, and your vision, and the life experiences that make you who you are."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I've seen firsthand that being president doesn't change who you are. It reveals who you are."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We need to do a better job of putting ourselves higher on our own 'to do' list."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "And Barack and I were raised with so many of the same values, like you work hard for what you want in life. That your word is your bond; that you do what you say you're going to do. That you treat people with dignity and respect, even if you don't know them and even if you don't agree with them."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success isn't about how much money you make. It's about the difference you make in people's lives."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When they go low, we go high."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Eleanor Roosevelt
        name = "Eleanor Roosevelt"
        
        text = "With the new day comes new strength and new thoughts."
        cats = ["Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The future belongs to those who believe in the beauty of their dreams."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We are afraid to care too much, for fear that the other person does not care at all."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Great minds discuss ideas; average minds discuss events; small minds discuss people."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "No one can make you feel inferior without your consent."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You must do the things you think you cannot do."
        cats = ["Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never allow a person to tell you no who doesn't have the power to say yes."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It takes as much energy to wish as it does to plan."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Happiness is not a goal; it is a by-product."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You gain strength, courage, and confidence by every experience in which you really stop to look fear in the face. You are able to say to yourself, 'I lived through this horror. I can take the next thing that comes along."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Serena Williams
        name = "Serena Williams"
        
        text = "Growing up I wasn’t the richest, but I had a rich family in spirit. Standing here with 19 championships is something I never thought would happen. I went on a court just with a ball and a racket and with a hope."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Think of all the girls who could become top athletes but quit sports because they’re afraid of having too many defined muscles and being made fun of or called unattractive."
        cats = ["Sports", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I decided I can’t pay a person to rewind time, so I may as well get over it."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think you have to love yourself before you fall in love. I’m still learning to love myself."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don’t like to lose — at anything… Yet I’ve grown most not from victories, but setbacks. If winning is God’s reward, then losing is how he teaches us."
        cats = ["Hungry", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Family’s first, and that’s what matters most. We realize that our love goes deeper than the tennis game."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "With a defeat, when you lose, you get up, you make it better, you try again. That’s what I do in life, when I get down, when I get sick, I don’t want to just stop. I keep going and I try to do more. Everyone always says never give up but you really have to take that to heart and really do never definitely give up. Keep trying."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I am lucky that whatever fear I have inside me, my desire to win is always stronger."
        cats = ["Sports", "Motivation"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I always believe I can beat the best, achieve the best. I always see myself in the top position."
        cats = ["Sports", "Motivation", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I really think a champion is defined not by their wins but by how they can recover when they fall."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You have to believe in yourself when no one else does."
        cats = ["Sports", "Empowerment", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Everything comes at a cost. Just what are you willing to pay for it?"
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Luck has nothing to do with it, because I have spent many, many hours, countless hours, on the court working for my one moment in time, not knowing when it would come."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think in life you should work on yourself until the day you die."
        cats = ["Sports", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Margaret Thatcher
        name = "Margaret Thatcher"
        
        text = "Don’t follow the crowd, let the crowd follow you."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Being powerful is like being a lady. If you have to tell people you are, you aren’t."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Look at a day when you are supremely satisfied at the end. It’s not a day when you lounge around doing nothing; it’s a day you’ve had everything to do and you’ve done it."
        cats = ["Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You may have to fight a battle more than once to win it."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you just set out to be liked, you will be prepared to compromise on anything at anytime, and would achieve nothing."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I do not know anyone who has gotten to the top without hard work. That is the recipe. It will not always get you to the top, but it will get you pretty near."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It pays to know the enemy — not least because at some time you may have the opportunity to turn him into a friend."
        cats = ["Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Disciplining yourself to do what you know is right and important, although difficult, is the highroad to pride, self-esteem, and personal satisfaction."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Richard Branson
        name = "Richard Branson"
        
        text = "Respect is how to treat everyone, not just those you want to impress."
        cats = []
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Train people well enough so they can leave, treat them well enough so they don’t want to."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There is no greater thing you can do with your life and your work than follow your passions – in a way that serves the world and you."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "As soon as something stops being fun, I think it’s time to move on. Life is too short to be unhappy. Waking up stressed and miserable is not a good way to live."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You don’t learn to walk by following rules. You learn by doing, and by falling over."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Do not be embarrassed by your failures, learn from them and start again."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Luck is what happens when preparation meets opportunity."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Whatever your goal is you will never succeed unless you let go of your fears and fly."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Hard-won things are more valuable than those that come too easily."
        cats = ["Entrepreneur", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "To be successful you have to be out there, you have to hit the ground running."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you spot an opportunity and are really excited by it, throw yourself into it with everything you’ve got."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Chance favors the prepared mind. The more you practice, luckier you become."
        cats = ["Entrepreneur", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Florence Griffith Joyner
        name = "Florence Griffith Joyner"
        
        text = "Conventional is not for me. I like things that are uniquely Flo. I like being different."
        cats = ["Sports"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "People want to think that staying in shape costs a lot of money. They couldn't be more wrong. It doesn't cost anything to walk. And it's probably a lot cheaper to go to the corner store and buy vegetables than take a family out for fast food."
        cats = ["Fitness"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don't always have the best eating habits. I like butter and ice cream. There are days when I should work out and I don't. But it's never too late to change old habits."
        cats = ["Fitness"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When anyone tells me I can't do anything... I'm just not listening any more."
        cats = ["Sports", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you want to run as fast as the men, you've got to train like the men."
        cats = ["Sports"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I've always overworked in the weight room. I love working with weights. I knew they'd give me the strength I needed."
        cats = ["Sports"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Robert Kiyosaki
        name = "Robert Kiyosaki"
        
        text = "In the real world, the smartest people are people who make mistakes and learn. In school, the smartest people don’t make mistakes."
        cats = ["Entrepreneur", "Success", "Motivational", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s not what you say out of your mouth that determines your life, it’s what you whisper to yourself that has the most power!"
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "It’s more important to grow your income than cut your expenses. It’s more important to grow your spirit than cut your dreams."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The most successful people in life are the ones who ask questions. They’re always learning. They’re always growing. They’re always pushing."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Don’t be addicted to money. Work to learn. don’t work for money. Work for knowledge."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "It’s easier to stand on the sidelines, criticize, and say why you shouldn’t do something. The sidelines are crowded. Get in the game."
        cats = ["Entrepreneur", "Success", "Motivational", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Complaining about your current position in life is worthless. Have a spine and do something about it instead."
        cats = ["Entrepreneur", "Success", "Motivational", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The fear of being different prevents most people from seeking new ways to solve their problems."
        cats = ["Entrepreneur", "Success", "Motivational", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Winners are not afraid of losing. But losers are. Failure is part of the process of success. People who avoid failure also avoid success."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Successful people ask questions. They seek new teachers. They’re always learning."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "If you want to be rich, you need to develop your vision. You must be standing on the edge of time gazing into the future."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The size of your success is measured by the strength of your desire; the size of your dream; and how you handle disappointment along the way."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "I’d rather welcome change than cling to the past."
        cats = ["Entrepreneur", "Success", "Motivational", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The more a person seeks security, the more that person gives up control over his life."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Hoping drains your energy. Action creates energy."
        cats = ["Entrepreneur", "Success", "Motivational", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Everyone can tell you the risk. An entrepreneur can see the reward."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "You’ll often find that it’s not mom or dad, husband or wife, or the kids that’s stopping you. It’s you. Get out of your own way."
        cats = ["Entrepreneur", "Success", "Motivational", "Empowerment", "Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The only difference between a rich person and poor person is how they use their time."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Your choices decide your fate. Take the time to make the right ones. If you make a mistake, that’s fine; learn from it & don’t make it again."
        cats = ["Entrepreneur", "Success", "Motivational", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "If you’re the kind of person who has no guts, you just give up every time life pushes you. If you’re that kind of person, you’ll live all your life playing it safe, doing the right things, saving yourself for something that never happens. Then, you die a boring old person."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "Talk is cheap. Learn to listen with your eyes. Actions do speak louder than words. Watch what a person does more than what he says."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "You will make some mistakes but, if you learn from those mistakes, those mistakes will become wisdom and wisdom is essential to becoming wealthy."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "If you realize that you’re the problem, then you can change yourself, learn something and grow wiser. Don’t blame other people for your problems."
        cats = ["Entrepreneur", "Success", "Motivational", "Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "As I said, I wish I could say it was easy. It wasn’t, but it wasn’t hard either. But without a strong reason or purpose, anything in life is hard."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
                
        text = "The single most powerful asset we all have is our mind. If it is trained well, it can create enormous wealth in what seems to be an instant."
        cats = ["Entrepreneur", "Success", "Motivational", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Find the game where you can win, and then commit your life to playing it; and play to win."
        cats = ["Entrepreneur", "Success", "Motivational", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The power of “can’t”: The word “can’t” makes strong people weak, blinds people who can see, saddens happy people, turns brave people into cowards, robs a genius of their brilliance, causes rich people to think poorly, and limits the achievements of that great person living inside us all."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Start small and dream big."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You’re only poor if you give up. The most important thing is that you did something. Most people only talk and dream of getting rich. You’ve done something."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sight is what you see with your eyes, vision is what you see with your mind."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never say you cannot afford something. That is a poor man’s attitude. Ask HOW to afford it."
        cats = ["Entrepreneur", "Success", "Motivational", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Your future is created by what you do today, not tomorrow."
        cats = ["Entrepreneur", "Success", "Motivational", "Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Find out where you are at, where you are going and build a plan to get there."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Most people want everyone else in the world to change themselves. Let me tell you, it’s easier to change yourself than everyone else."
        cats = ["Entrepreneur", "Success", "Motivational", "Change", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "People who dream small dreams continue to live as small people."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There are those who make things happen, there are those who watch things happen and there are those who say ‘what happened?"
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Losers quit when they fail. Winners fail until they succeed."
        cats = ["Entrepreneur", "Success", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Education is cheap; experience is expensive."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We all have tremendous potential, and we all are blessed with gifts. Yet, the one thing that holds all of us back is some degree of self-doubt. It is not so much the lack of technical information that holds us back, but more the lack of self-confidence."
        cats = ["Entrepreneur", "Success", "Motivational", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Tomorrows only exist in the minds of dreamers and losers."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Excuses cost a dime and that’s why the poor could afford a lot of it."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "People need to wake up and realize that life doesn’t wait for you. If you want something, get up and go after it."
        cats = ["Entrepreneur", "Success", "Motivational", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When people are lame, they love to blame."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It is easy to stay the same but it is not easy to change. Most people choose to stay the same all their lives."
        cats = ["Entrepreneur", "Success", "Motivational", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A winning strategy must include losing."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Face your fears and doubts, and new worlds will open to you."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sometimes you win, sometimes you learn."
        cats = ["Entrepreneur", "Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         //Idris Elba
        name = "Idris Elba"
        
        text = "Waking up in truth is so much better than living in a lie."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’m an ambitious person. I never considered myself in competition with anyone, and I’m not saying that from an arrogant standpoint, It’s just that my journey started so, so long ago, and I’m still on it and I won’t stand still."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        
        text = "I’m not afraid to fail. I’m not afraid to fall over and make a mistake. That often cripples people on the onset of getting into anything."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Work hard, sleep less."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I love working. I’m a workaholic and I’m really privileged for some of the jobs I get offered and so I just want to keep going.”"
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t just give yourself boundaries!"
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
         text = "You wont know you got to the top until you got there."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Fear nothing. Do what you want to do, but be educated and intelligent and confident about it."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
              
        text = "Someone who’s got a full-time trainer or a boxer, someone who’s got a major disability, but who doesn’t let that get in his way, that’s a really good message for someone who is able-bodied. It can make them think, ‘wow, I suppose I could be doing better for myself."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Know what your target is, don’t guess it… if you don’t know what your targets are you’re never going to get there."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It turns out that you make your own luck but you work hard to keep it."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //CT Fletcher
        name = "CT Fletcher"
        
        text = "You may fight me every step of the way, you may hurt, you may ache, but resistance is futile!"
        cats = ["Fitness", "Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Greatness, in any field, cannot be achieved without obsession."
        cats = ["Fitness", "Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The most powerful motivational speeches that I’ve ever heard came from people who told me I couldn’t do something. I was bound and determined to show them that I could."
        cats = ["Fitness", "Success", "Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)   
        
        text = "Never accept the limitations of someone else!"
        cats = ["Fitness", "Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "No matter how slow you go you are still lapping everybody on the couch."
        cats = ["Fitness", "Success", "Motivational", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You have to start, with the belief, that you can do something."
        cats = ["Fitness", "Success", "Motivational", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)        
        
        text = "I don’t know how many more reps… I’ma do this till I can’t do it no more!"
        cats = ["Fitness", "Success", "Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Everything is impossible, until someone crazy enough comes along and makes it possible."
        cats = ["Fitness", "Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Suffer the pain of discipline or suffer the pain of regret."
        cats = ["Fitness", "Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Nelson Mandella
        name = "Nelson Mandela"
        
        text = "It always seems impossible until it's done."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I learned that courage was not the absence of fear, but the triumph over it. The brave man is not he who does not feel afraid, but he who conquers that fear."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "After climbing a great hill, one only finds that there are many more hills to climb."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A good head and a good heart are always a formidable combination."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Forget the past."
        cats = ["Success", "Motivational", "Change"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There is no passion to be found playing small - in settling for a life that is less than the one you are capable of living."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Courageous people do not fear forgiving, for the sake of peace."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When the water starts boiling it is foolish to turn off the heat."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There is no easy walk to freedom anywhere, and many of us will have to pass through the valley of the shadow of death again and again before we reach the mountaintop of our desires."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "May your choices reflect your hopes, not your fears."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        
        text = "The greatest glory in living is not in falling, but in rising every time we fall."
        cats = ["Success", "Motivational", "Change"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I am the master of my fate: I am the captain of my soul."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sometimes, it falls upon a generation to be great. You can be that great generation. Let your greatness blossom."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Our deepest fear is not that we are inadequate. Our deepest fear is that we are powerful beyond measure."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I never lose. I either win or learn."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It is what we make out of what we have given, not what we are given, that separates one person from another."
        cats = ["Success", "Motivational", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Action without vision is only passing time, vision without action is merely day dreaming, but vision with action can change the world."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When people are determined they can overcome anything."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We can change the world and make it a better place. It is in your hands to make a difference."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        //Walt Disney
        name = "Walt Disney"
       
        text = "If you can dream it, you can do it."
        cats = ["Success", "Motivational", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "It’s kind of fun to do the impossible.”"
        cats = ["Success", "Motivational", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "That’s the real trouble with the world, too many people grow up."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Do your best work then try to trump it."
        cats = ["Success", "Motivational", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Around here, however, we don’t look backward for very long. We keep moving forward, opening new doors, and doing new things, because we’re curious and curiosity keeps leading us down new paths."
        cats = ["Success", "Motivational", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Laughter is timeless, imagination has no age and dreams are forever."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Do what you do so well that they want to see it again and bring their friends."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Whatever you do, do it well."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "All our dreams can come true if we have the courage to pursue them."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Times and conditions change so rapidly that we must keep our aim constantly focused on the future."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "All the adversity I’ve had in my life, all the troubles and obstacles, have strengthened me. You may not realize it when it happens, but a kick in the teeth may be the best thing in the world for you."
        cats = ["Change", "Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "A person should set his goals as early as he can and devote all his energy and talent to getting there."
        cats = ["Success", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The more you are in a state of gratitude, the more you will attract things to be grateful for."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The way to get started is to quit talking and begin doing."
        cats = ["Success", "Change"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Faith is the most important thing. If you believe in something, believe it till the end, unequivocally and without hesitation."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "First, think. Second, believe. Third, dream. And finally, dare."
        cats = ["Entrepreneur", "Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Growing old is mandatory, but growing up is optional."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We create happiness."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never forget! You can design, create, and build the most wonderful place in the world. But it takes people to make a dream a reality."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Happiness is a state of mind. it’s just according to the way you look at things."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Who says we have to grow up?"
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "The greatest moments in life are not concerned with selfish achievements but rather with the things we do for the people we love and esteem."
        cats = ["Relationships"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "In bad times and in good, I have never lost my sense of zest for life."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Do a good job. You don’t have to worry about the money; it will take care of itself."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Dreams, ideas, and plans not only are an escape, they give me purpose, a reason to hang on."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It is good to have a failure while you’re young because it teaches you so much, and once you’ve lived through the worst, you’re never quite as vulnerable afterward."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Adults are only kids grown up."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The difference in winning and losing is most often not quitting."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        //Dale Carnegie
        name = "Dale Carnegie"
        
        text = "Take a chance! All life is a chance. The man who goes farthest is generally the one who is willing to do and dare."
        cats = ["Entrepreneur", "Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Develop success from failure. Discouragement and failure are two of the surest stepping stones to success."
        cats = ["Entrepreneur", "Success", "Change"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you want to conquer fear, don’t sit home and think about it. Go out and get busy."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Remember, today is the tomorrow you worried about yesterday."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Most of the important things in the world have been accomplished by people who have kept on trying when there seemed to be no hope at all."
        cats = ["Entrepreneur", "Success", "Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Rule number one: Don’t criticize, condemn, or complain."
        cats = ["Relationships"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Be concerned with your character than with your reputation, for your character is what you are, while your reputation is merely what others think you are."
        cats = ["Relationships", "Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Do the thing you fear to do and keep on doing it, that is the quickest and surest way ever yet discovered to conquer fear."
        cats = ["Change"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Fear doesn’t exist anywhere except in the mind."
        cats = ["Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Fear is the result of a lack of confidence. A lack of confidence is the result of not knowing what you can do. A lack of knowing what you can do is caused by a lack of experience. A lack of experience is caused by a lack of doing something new."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When dealing with people remember you are not dealing with creatures of logic but creatures of emotion."
        cats = ["Relationships"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "People like people who help them like themselves."
        cats = ["Relationships"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Keep busy. It’s the cheapest kind of medicine there is."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Don’t be afraid to give your best to what seemingly are small jobs. Every time you conquer one it makes you that much stronger. If you do the little jobs well, the big ones will tend to take care of themselves."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Happiness doesn’t depend on any external conditions, it is governed by our mental attitude."
        cats = ["Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "One of the most tragic things I know about human nature is that all of us tend to put off living. We are all dreaming of some magical rose garden over the horizon instead of enjoying the roses that are blooming outside our windows today."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Do the hard jobs first. The easy jobs will take care of themselves."
        cats = ["Success", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you believe in what you are doing, then let nothing hold you up in your work. Much of the best work of the world has been done against seeming impossibilities. The thing is to get the work done."
        cats = ["Entrepreneur", "Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Are you bored with life? Then throw yourself into some work you believe in with all your heart, live for it, die for it, and you will find happiness that you had thought could never be yours."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Our fatigue is often caused not by work but by worry, frustration, and resentment."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The successful man will profit from his mistakes and try again in a different way."
        cats = ["Entrepreneur", "Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It isn’t what you have or who you are or where you are or what you are doing that makes you happy or unhappy. It is what you think about."
        cats = ["Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Any fool can criticize, condemn and complain, and most fools do."
        cats = ["Relationships"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "Success is getting what you want. Happiness is wanting what you get."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Most of us have far more courage than we ever dreamed we possessed."
        cats = ["Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "An hour of planning can save you 10 hours of doing."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Action breeds confidence and courage."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Our thoughts make us what we are."
        cats = ["Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        //Robert Downey Jr
        name = "Robert Downey Jr"
        
        text = "Worrying is like praying for something that you don’t want to happen."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Listen, smile, agree and then do whatever you were gonna do anyway."
        cats = ["Success", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sometimes you just gotta be drop-kicked out of the nest."
        cats = ["Change"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The lesson is that you can still make mistakes and be forgiven.”"
        cats = ["Relationships"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Look, even bad years are pretty good years, I think."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "For years I took pride in being resilient."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You need to know what to do when the sun is not shining."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think you end up doing the stuff you were supposed to do at the time you were supposed to do it."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think that we all do heroic things, but hero is not a noun, it’s a verb."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think that the power is the principle. The principle of moving forward, as though you have the confidence to move forward, eventually gives you confidence when you look back and see what you’ve done."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "I always think part of success is being able to replicate results, taking what is interesting or viable about yourself as a professional person and seeing if you bring it into different situations with similar results."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "People never change because they are under threat or under duress. Never. They change because they see something that makes their life seem valuable enough to start moving toward a life worth living."
        cats = ["Change"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Remember that just because you hit bottom doesn’t mean you have to stay there."
        cats = ["Change"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don’t need an Iron Man suit."
        cats = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I know who I am."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "I am in the continual process of transcending fear."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Mediocrity is my biggest fear. I’m not afraid of total failure because I don’t think that will happen. I’m not afraid of success because that beats the hell out of failure. It’s being in the middle that scares me."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Nothing will serve you better than a strong work ethic. Nothing."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I think it’s good to be confident. If I’m not on my team why should anybody else be?"
        cats = ["Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The higher the stakes, the happier I am, the better I will be."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "People rise out of the ashes because, at some point, they are invested with a belief in the possibility of triumph over seemingly impossible odds."
        cats = ["Change"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I have a sense of destiny that you are led to the things you are supposed to do."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        //Lionel Messi    
        name = "Lionel Messi"
        
        text = "You have to fight to reach your dream. You have to sacrifice and work hard for it."
        cats = ["Success", "Sports"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The best decisions aren’t made with your mind, but with your instinct."
        cats = ["Sports"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A lion doesn’t concern himself with the opinions of the sheep."
        cats = ["Sports", "Hungry", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "You can overcome anything, if and only if you love something enough."
        cats = ["Sports", "Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There are more important things in life than winning or losing a game."
        cats = ["Sports"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Money is not a motivating factor… My motivation comes from playing the game I love. If I wasn’t paid to be a professional footballer, I would willingly play for nothing."
        cats = ["Sports", "Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sometimes you have to accept you can’t win all the time."
        cats = ["Sports"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When the year starts, the objective is to win with all the team, personal records are secondary."
        cats = ["Sports", "Relationships"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)

        text = "I think my desire to always get better, to always want more, to always be my top critic, and accepting the good and the bad."
        cats = ["Sports", "Hungry", "Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Confucius"
        
        text = "I start early and I stay late, day after day, year after year. It took me 17 years and 114 days to become an overnight success."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Rob Siltanen"
        
        text = "People who are crazy enough to think they can change the world, are the ones who do."
        cats = ["Success", "Motivational", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "C.S. Lewis"
        
        text = "You are never too old to set another goal or to dream a new dream."
        cats = ["Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Brian Tracy"
        
        text = "Fake it until you make it! Act as if you had all the confidence you require until it becomes your reality."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Jack Canfield"
        
        text = "For every reason it’s not possible, there are hundreds of people who have faced the same circumstances and succeeded."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "John Wooden"
        
        text = "Things work out best for those who make the best of how things work out."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Michael Phelps"
        
        text = "I think goals should never be easy, they should force you to work, even if they are uncomfortable at the time."
        cats = ["Success", "Sports"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Zig Ziglar"
        
        text = "You don’t have to be great to start, but you have to start to be great."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "What you get by achieving your goals is not as important as what you become by achieving your goals."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "George Herbert"
        
        text = "Do not wait; the time will never be just right. Start where you stand, and work with whatever tools you may have at your command, and better tools will be found as you go along."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        
        name = "Sam Levenson"
        
        text = "Don’t watch the clock; do what it does. Keep going."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Michael Korda"
        
        text = "One way to keep momentum going is to have constantly greater goals."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Simone de Beauvoir"
        
        text = "Change your life today. Don’t gamble on the future, act now, without delay."
        cats = ["Success", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Kevin Ngo"
        
        text = "Why should you continue going after your dreams? Because seeing the look on the faces of the people who said you couldn’t… will be priceless."
        cats = ["Success", "Motivational", "Hungry" ]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Spryte Loriano"
        
        text = "Every great story on the planet happened when someone decided not to give up, but kept going no matter what."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Jim Rohn"
        
        text = "Successful people do what unsuccessful people are not willing to do. Don’t wish it were easier, wish you were better."
        cats = ["Success", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "John D. Rockefeller"
        
        text = "Don’t be afraid to give up the good to go for the great."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Henry Ford"
        
        text = "Obstacles are those frightful things you see when you take your eyes off your goals."
        cats = ["Success", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Seth Godin"
        
        text = "How dare you settle for less when the world has made it so easy for you to be remarkable?"
        cats = ["Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Farrah Gray"
        
        text = "Build your own dreams or someone else will hire you to build theirs."
        cats = ["Success", "Empowerment", "Motivational", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Karen Lamb"
        
        text = "A year from now you may wish you had started today."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Earl Nightingale"
        
        text = "Never give up on a dream just because of the time it will take to accomplish it. The time will pass anyway."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Aldous Huxley"
        
        text = "There’s only one corner of the universe you can be certain of improving, and that’s your own self."
        cats = ["Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "George S. Patton"
        
        text = "Accept the challenges so that you can feel the exhilaration of victory."
        cats = ["Success", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Theodore Roosevelt"
        
        text = "Nobody cares how much you know, until they know how much you care."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Carol Burnett"
        
        text = "Only I can change my life. No one can do it for me."
        cats = ["Success", "Empowerment", "Motivational"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Og Mandino"
        
        text = "Failure will never overtake me if my determination to succeed is strong enough."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Mahatma Ghandi"
        
        text = "Be the change that you want to see in the world."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A man is but a product of his thoughts. What he thinks he becomes."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I will not let anyone walk through my mind with their dirty feet."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Nobody can hurt me without my permission."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Happiness is when what you think, what you say, and what you do are in harmony."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "An ounce of practice is worth a thousand words."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Live as if you were to die tomorrow. Learn as if you were to live forever."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "In a gentle way, you can shake the world."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If I have the belief that I can do it, I shall surely acquire the capacity to do it even if I may not have it at the beginning.

"
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "An eye for an eye will make the whole world blind."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The future depends on what you do today."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You don’t know who is important to you until you actually lose them."
        cats = ["Success", "Relationships"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You may never know what results come of your actions, but if you do nothing, there will be no results."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I cannot conceive of a greater loss than the loss of one’s self-respect."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You must not lose faith in humanity. Humanity is like an ocean; if a few drops of the ocean are dirty, the ocean does not become dirty."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Drake"
        
        text = "Life can always change, you have to adjust."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Live without pretending, Love without depending, Listen without defending, Speak without offending."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A goal is just a dream with a deadline."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
      
        text = "Tables turn, bridges burn, you live and learn."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you look ahead and darkness is all you see, faith and determination will pull you through."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’m trying to do better than good enough."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I was born to make mistakes, not to fake perfection."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sometimes it’s the journey that teaches you a lot about your destination."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Strength isn’t always shown in what you can hold on to, sometimes it’s shown in what you can let go of."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Wonder Woman" 
        
        text = "Women seem like sissies because you don’t know their true strength."
        cats = ["Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "J. Cole"
        
        text = "Anything’s possible, you gotta dream like you never seen obstacles."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I put a lot of pressure on myself. I think something’s not good enough, and I won’t stop until I feel like I’ve made it."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You are perfect exactly as you are. With all your flaws and problems, there’s no need to change anything. All you need to change is the thought that you aren’t good enough."
        cats = ["Success", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We got dreams and we got the right to chase ’em."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Hard to move on when you always regret one."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sometimes our dreams come true, sometimes our fears do too."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you truly believe it, that’s step one. Step two, is, you know, the hard work that goes along with it."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’m here to spread a message of hope. Follow your heart. Don’t follow what you’ve been told you’re supposed to do."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "They say time is money but really, it’s not. If we ever go broke, time is all we got."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I feel like this: Whatever is in your path and in your heart, you need to do."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never give up until you’ve given out all your very best. It’s better to fail trying, than wondering what could have happened if you tried."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Take a chance, because you never know how perfect something can turn out."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’d rather be happy being myself than sad trying to please everyone else."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Nothing lasts forever, but at least we’ve got these memories."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You have no control over what somebody else feels about you, but you have 100 percent control over how you feel about yourself and how you feel about the people around you and how you handle life."
        cats = ["Success", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Harvey Specter"
        
        text = "You always have a choice."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sorry, I can’t hear you over the sound of how awesome I am."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Anyone can do my job, but no one can be me."
        cats = ["Success", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don’t have dreams, I have goals."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s going to happen, because I am going to make it happen."
        cats = ["Success", "Entrepreneur", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Ever loved someone so much, you would do anything for them? Yeah, well make that someone yourself and do whatever the hell you want."
        cats = ["Success", "Hungry", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s not bragging if it’s true."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Win a no win situation by rewriting the rules."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Let them hate, just make sure they spell your name right."
        cats = ["Success", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "That’s the difference between you and me. You wanna lose small, I wanna win big."
        cats = ["Success", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Winners don’t make excuses."
        cats = ["Success", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don't raise your voice. Improve your arguement."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Time is free, but it's priceless. You can't own it, but you can spend it. Once you've lost it, you can never get it back."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You're never going to win big if you're only going to minimise your losses."
        cats = ["Success", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never give up on something that you can't go a day without thinking about."
        cats = ["Success", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life has two rules: 1. Never quit 2. Always remember rule #1"
        cats = ["Success", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You want to change your life? Change the way you think."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Winners don't make excuses when the other side plays the game. "
        cats = ["Success", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Work until you no longer have to introduce yourself."
        cats = ["Success", "Motivational", "Hungry", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Anyone can do my job, but no one can be me."
        cats = ["Success", "Empowerment"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "97% of people who gave up are employed by the 3% who never gave up."
        cats = ["Success", "Motivational", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The only time success comes before work is in the dictionary."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You do what they say or they shoot you right? Wrong! You take the gun. You pull our a bigeer gun or you can call their bluff or you do one of another 146 things."
        cats = ["Success", "Entrepreneur"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "David Goggins"
        
        text = "It’s so easy to be great nowadays, because everyone else is weak. If you have ANY mental toughness, if you have any fraction of self-discipline; The ability to not want to do it, but still do it; If you can get through to doing things that you hate to do: on the other side is GREATNESS "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We live in an external world. Everything, you have to see it, touch it. If you can for the rest of your life, live inside yourself – to find greatness, you have to go inside."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I tried to do so many things to fit in. But when you look in the mirror, that’s the one person you can’t lie to."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Most people who doubt you doubt you because they can never see themselves doing what you are trying to do. "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The path to success will leave you callused, bruised, and very tired. It will also leave you empowered. "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t let your body or mind do exactly what it wants to do! Take control! "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never let people who choose the path of least resistance steer you away from your chosen path of most resistance."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t be the person that looks at the weather report the night before to decide what you are going to do the next day."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Be true to whoever or whatever you are and wear it like a badge of honor. Fit in with one person and one person only: yourself."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t limit expectations of yourself and settle for anything less than what you are truly capable of achieving."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you fall down, focus on the solution, not the problem. You might quit or fail 100 times. Keep that clear picture of where you want to be. "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Teach yourself that it isn’t ok to take the easy way out. Make sure you are bothered by the things you set out to do but did not complete or make time for in the day. "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You can will yourself to do almost anything you want."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you think you’re done, you’re only at 40% of your body’s capability. "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "On bad days it’s important to get your nose out of the problem! What does that mean? It means you can’t get a clear view of the problem if you are living in it. Pull yourself away from the problem and you will see how different the problem looks."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We have the ability to make very easy things seem impossible. Stop losing the mind game against yourself."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Comfort zones: If you like in one too long…that becomes your norm. Get comfortable being uncomfortable."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Get over whatever is stopping you from being your best self! Rather than use the obstacles and setbacks in your life as excuses, use them as the catalyst to get better and go further in life. "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Most people who are criticizing and judging haven’t even tried what you failed at."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Stop thinking and do something."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Take time to take inventory of your life. Look in the mirror and hold yourself accountable."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Before you open your mouth and criticize someone, think about how you would feel if you were the person you were criticizing. "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sometimes you must go to war with yourself to fix yourself. "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A lot of people put motivational quotes up on the wall and all they do is collect dust. Become what that quote says. Live it every day."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Show people, don’t tell people! "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Stop making excuses. Stop being a victim. Take personal responsibility. Hold yourself accountable. Get comfortable with the uncomfortable. And finally, make your dreams come true."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You may lose the battle of the morning but don’t lose the war of the day. "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Most of the amazing things in this world come from people who know how to turn their failure into a success."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you can see yourself doing something, you can do it. If you can’t see yourself doing it, usually you can’t achieve it. "
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
       
        name = "Helen Keller"
        
        text = "Optimism is the faith that leads to achievement. Nothing can be done without hope and confidence."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life is either a daring adventure or nothing."
        cats = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never bend your head. Always hold it high. Look the world straight in the eye."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The only thing worse than being blind is having sight but no vision."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "What I am looking for is not out there, it is in me."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The most beautiful things in the world cannot be seen or even touched, they must be felt with the heart."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We can do anything we want to if we stick to it long enough."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "All the world is full of suffering. It is also full of overcoming."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "While they were saying among themselves it cannot be done, it was done."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Avoiding danger is no safer in the long run than outright exposure. The fearful are caught as often as the bold."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Science may have found a cure for most evils; but it has found no remedy for the worst of them all -- the apathy of human beings."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Happiness does not come from without, it comes from within."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Face your deficiencies and acknowledge them; but do not let them master you. Let them teach you patience, sweetness, insight."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
         
        name = "Tony Robbins"
        
        text = "“Identify your problems, but give your power and energy to solutions."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Your past does not equal your future."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s what you practice in private that you will be rewarded for in public."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Every problem is a gift–without problems we would not grow."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "In life you need either inspiration or desperation."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you can’t, you must. If you must, you can."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success is doing what you want to do, when you want, where you want, with whom you want, as much as you want."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We can change our lives. We can do, have, and be exactly what we wish"
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you are grateful fear disappears and abundance appears."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The meeting of preparation with opportunity generates the offspring we call luck."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you do what you’ve always done, you’ll get what you’ve always gotten."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It is in your moments of decision that your destiny is shaped."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A real decision is measured by the fact that you’ve taken a new action. If there’s no action, you haven’t truly decided."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You see, in life, lots of people know what to do, but few people actually do what they know. Knowing is not enough! You must take action."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Most people fail in life because they major in minor things."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The only thing that’s keeping you from getting what you want is the story you keep telling yourself."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I challenge you to make your life a masterpiece. I challenge you to join the ranks of those people who live what they teach, who walk their talk."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You don’t have to have a reason to feel good—you’re alive; you can feel good for no reason at all!"
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s not what we do once in a while that shapes our lives, but what we do consistently."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success in life is the result of good judgment. Good judgment is usually the result of experience. Experience is usually the result of bad judgment."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "People are not lazy, they simply have impotent goals. That is goals that do not inspire them."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you talk about it, it’s a dream, if you envision it, it’s possible, but if you schedule it, it’s real."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Why live an ordinary life, when you can live an extraordinary one."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Any time you sincerely want to make a change, the first thing you must do is to raise your standards."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Stay committed to your decisions, but stay flexible in your approach."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The more rejection you get, the better you are, the more you’ve learned, the closer you are to your outcome… If you can handle rejection, you’ll learn to get everything you want."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Take the opportunity to learn from your mistakes: find the cause of your problem and eliminate it. Don’t try to be perfect; just be an excellent example of being human."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Bruce Lee"
        
        text = "“Ever since I was a child I have had this instinctive urge for expansion and growth. To me, the function and duty of a quality human being is the sincere and honest development of one’s potential."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I fear not the man who has practiced 10,000 kicks once, but I fear the man who has practiced one kick 10,000 times."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you spend too much time thinking about a thing, you’ll never get it done. Make at least one definite move daily toward your goal."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A goal is not always meant to be reached, it often serves simply as something to aim at."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Be like water making its way through cracks. Do not be assertive, but adjust to the object, and you shall find a way round or through it. If nothing within you stays rigid, outward things will disclose themselves. Empty your mind, be formless. Shapeless, like water. If you put water into a cup, it becomes the cup. You put water into a bottle and it becomes the bottle. You put it in a teapot it becomes the teapot. Now, water can flow or it can crash. Be water, my friend."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Absorb what is useful, Discard what is not, Add what is uniquely your own."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The possession of anything begins in the mind."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you always put limit on everything you do, physical or anything else. It will spread into your work and into your life. There are no limits. There are only plateaus, and you must not stay there, you must go beyond them."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The doubters said, ‘Man can not fly,’ The doers said, ‘Maybe, but we’ll try,’ and finally soared in the morning glow while non-believers watched from below."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The key to immortality is first living a life worth remembering."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Notice that the stiffest tree is most easily cracked, while the bamboo or willow survives by bending with the wind."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Knowing is not enough, we must apply. Willing is not enough, we must do."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "What you habitually think largely determines what you will ultimately become."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Defeat is a state of mind; No one is ever defeated until defeat has been accepted as a reality."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Preparation for tomorrow is hard work today."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        
        
        name = "Ayn Rand"
        
        /*text = "A creative man is motivated by the desire to achieve, not by the desire to beat others."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Kyle Chandler"
        
        text = "Opportunity does not knock, it presents itself when you beat down the door."
        cats = ["Success", "Hungry"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "William James"
        
        text = "Act as if what you do makes a difference. It does."
        cats = ["Success"]
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)*/
    }
    
    
    
}
