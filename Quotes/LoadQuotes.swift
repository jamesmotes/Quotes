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
        
        var iterator = 0
        
        var name : String = String()
        var text : String = String()
        var cats : [String] = [String]()
        var moos : [String] = [String]()
        var id : Int = Int()
        
        
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
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "When I was in college, I wanted to be involved in things that would change the world."
        cats = ["Entrepreneur", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "If there was a way I could not eat, so I could work more, I would not eat. I wish there was a way to get nutrients without sitting down for a meal."
        cats = ["Entrepreneur", "Change"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "If you get up in the morning and think the future is going to be better it is a bright day. Otherwise, it's not. "
        cats = ["Entrepreneur", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "I think it's very important to have a feedback loop, where you're constantly thinking about what you've done and how you could be doing it better. I think that's the single best piece of advice: constantly think about how you could be doing things better and questioning yourself."
        cats = ["Entrepreneur", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "When Henry Ford made cheap, reliable cars people said, 'Nah, what's wrong with a horse?' That was a huge bet he made, and it worked."
        cats = ["Entrepreneur", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "I would like to die on Mars. Just not on impact. "
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "I think that's the single best piece of advice: constantly think about how you could be doing things better and questioning yourself."
        cats = ["Success", "Entrepreneur", "Change"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "There's a silly notion that failure's not an option at NASA. Failure is an option here. If things are not failing, you are not innovating enough."
        cats = ["Success", "Entrepreneur", "Change"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "I'm interested in things that change the world or that affect the future and wondrous, new technology where you see it, and you're like, 'Wow, how did that even happen? How is that possible?'"
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "It's OK to have your eggs in one basket as long as you control what happens to that basket."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "I don't create companies for the sake of creating companies, but to get things done."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "When something is important enough, you do it even if the odds are not in your favor. "
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "We're going to make it happen. As God is my bloody witness, I'm hell-bent on making it work."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "I think it is possible for ordinary people to choose to be extraordinary. "
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "I could either watch it happen or be a part of it."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "We’re changing the world and changing history, and you either commit or you don’t"
        cats = ["Success", "Entrepreneur"]
        moos = ["Motiviational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "There's a tremendous bias against taking risks. Everyone is trying to optimize their ass-covering."
        cats = ["Entreprenuer", "Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "I don't think it's a good idea to plan to sell a company."
        cats = ["Entrepreneur"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "People work better when they know what the goal is and why. It is important that people look forward to coming to work in the morning and enjoy working."
        cats = ["Entrepreneur"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "If you're co-founder or CEO, you have to do all kinds of tasks you might not want to do... If you don't do your chores, the company won't succeed... No task is too menial."
        cats = ["Entrepreneur"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "My biggest mistake is probably weighing too much on someone's talent and not someone's personality. I think it matters whether someone has a good heart."
        cats = ["Entrepreneur"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "Starting and growing a business is as much about the innovation, drive, and determination of the people behind it as the product they sell."
        cats = ["Entrepreneur"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "The first step is to establish that something is possible; then probability will occur."
        cats = ["Entrepreneur", "Change"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
      
        text = "Really pay attention to negative feedback and solicit it, particularly from friends. ... Hardly anyone does that, and it's incredibly helpful."
        cats = ["Entrepreneur", "Change"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "Being an entrepreneur is like eating glass and staring into the abyss of death."
        cats = ["Entrepreneur"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "I wouldn't say I have a lack of fear. In fact, I'd like my fear emotion to be less because it's very distracting and fries my nervous system."
        cats = ["Entrepreneur", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "When somebody has a breakthrough innovation, it is rarely one little thing. Very rarely, is it one little thing. It's usually a whole bunch of things that collectively amount to a huge innovation."
        cats = ["Entrepreneur", "Change", "Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        
        //Gary Vaynerchuck
        name = "Gary Vaynerchuck"
        
        text = "Skills are cheap. Passion is priceless."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "Look yourself in the mirror and ask yourself: What do I want to do every day for the rest of my life? DO THAT"
        cats = ["Success", "Entrepreneur", "Change"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "Complaining is a zero return investment."
        cats = ["Success", "Entrepreneur", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "I'm grinding when you're sleeping."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "I'm not worried about getting boo'd in the third quarter. Talk to me after the game."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "Doing it is the only option."
        cats = ["Success", "Entrepreneur", "Change"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
         text = "If you're not dreaming big for yourself, who's going to do it for you?"
        cats = ["Success", "Entrepreneur", "Change"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
                
        //Big Brandon Carter
        name = "Big Brandon Carter"
        
        text = "This is planet earth. Results are the only thing that matters on planet earth."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "You got to take responsibility for your own success. Regardless of your circumstances."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Crying only works for babies."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                      
        text = "Men are expected to produce results. That's how you're going to be judged. On what you produce, or what you don't."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                              
        text = "Nobody is going to have pity on you."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                              
        text = "Don't worry about what he has. What do you have? What are you going to do to be successful? What are you going to do to accomplish your goals?"
        cats = ["Success", "Entrepreneur", "Fitness", "Change"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                              
        text = "Some people may have some advantages that you don't have. You may have to work harder than them... So work harder than them! If thats what it takes than thats what you do."
        cats = ["Success", "Entrepreneur", "Fitness", "Change"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                              
        text = "With every excuse you make, you're putting your weakness on display for the whole world to see."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Today I want you to promise yourself that you're done making excuses forever. You're done. You're going to set goals and you're going to accomplish them no matter what stands in your way.  "
        cats = ["Success", "Entrepreneur", "Fitness", "Change"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "No matter how many times you fall down, you're going to get back up. You're going to keep going. You're going to keep pushing. "
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "You have to have extreme actions to have extreme results."
        cats = ["Success", "Entrepreneur", "Fitness"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Chill don't pay the bills."
        cats = ["Success", "Entrepreneur"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
                
        //DJ Khaled
        name = "DJ Khaled"
        
        text = "They kick you when you’re down, but they wanna kick it when you’re up."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "You can never run out of keys."
        cats = ["Success"]
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Don’t ever play yourself."
        cats = ["Success"]
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "“You gotta water your plants. Nobody can water them for you.”"
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Stay focused and secure your bag, because they want you to fail and they don’t want us to win."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "We gonna win more. We gonna live more. We the best."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I’m gonna go hard no matter what because I gotta feed my family and I gotta feed myself."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "At the end of the day, I understand that life has road blocks, and life is like school - you'll be tested; we gotta pass it.."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "We all want to win more, but it's all about being blessed and embracing your blessings. We have life."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "Key is never be afraid of being yourself. Never!"
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
 
        text = "I wake up every day inspiring myself, because God gave me life."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
       
        text = "I remember they used to tell me, they said, 'Khaled, you can't get a Rolls-Royce; you need to get one of them small ones.' So I went and bought a Phantom."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                         
        text = "People will try to bring you down, but you gotta go up."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "I always make my dreams into goals."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                    
        text = "We can take a 'It was hard to get there.' But we ain't taking no loss. We're going to win."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                         
        text = "That's when you know you're the greatest: when you're the greatest, and people still put odds against you."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
    
        text = "They will try to close the door on you, just open it."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Those that weather the storm are the great ones."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "They don’t want you to win. They don’t want you to have the No. 1 record in the country. They don’t want you get healthy. They don’t want you to exercise. And they don’t want you to have that view."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        text = "We go hard. In everything we do we’re going to accomplish our victory and our goal. If it takes a day, a year, or 20 years, we’re going to win. I haven’t taken a loss because everything I’ve done has been a working process to win. From being a kid on them turntables to becoming where I am is not a loss. It’s a blessing."
        cats = ["Success"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
         
                
        //Barack Obama
        name = "Barack Obama"
        
        text = "If you're walking down the right path and you're willing to keep walking, eventually you'll make progress."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Change will not come if we wait for some other person or some other time. We are the ones we've been waiting for. We are the change that we seek."
        cats = ["Success", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "The future rewards those who press on. I don't have time to feel sorry for myself. I don't have time to complain. I'm going to press on. "
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Yes we can."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Focusing your life solely on making a buck shows a poverty of ambition. It asks too little of yourself, and it will leave you unfulfilled. "
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "You can't let your failures define you. You have to let your failures teach you."
        cats = ["Success", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
    
        text = "Where you are right now doesn't have to determine where you'll end up."
        cats = ["Success", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Change is never easy but always possible."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                      
        text = "While we breathe, we will hope. "
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "We don't ask you to believe in our ability to bring change, rather, we ask you to believe in yours. "
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "There is no excuse for not trying."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Nothing in life that's worth anything is easy."
        cats = ["Success"]
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
 
        text = "Progress will come in fits and starts. It's not always a straight line. It's not always a smooth path."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "The cynics may be the loudest voices- but I promise you, they will accomplish the least."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "One voice can change a room."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "We need to internalize this idea of excellence. Not many folks spend a lot of time trying to be excellent."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "If you work hard and meet your responsibilities, you can get ahead, no matter where you come from, what you look like or who you love."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Making your mark on the world is hard. If it were easy, everybody would do it. But it's not. It takes patience, it takes commitment and it comes with plenty of failure along the way."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "The best way to not feel hopeless is to get up and do something."
        cats = ["Success", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "We did not come here to fear the future. We came here to shape it."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "If you run you stand a chance of losing, but if you don't run you've already lost."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Our destiny is not written for us, but by us."
        cats = ["Success", "Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                  
        text = "Your voice can change the world."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
          
                
        //Lebron James
        name = "Lebron James"
        
        text = "Don’t be afraid of failure. This is the way to succeed."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I’m going to use all my tools, my god-given ability, and make the best life I can with it."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
         text = "Dream as if you’ll live forever. Live as if you’ll die today."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
         text = "You can’t be afraid to fail. It’s the only way you succeed. You’re not gonna succeed all the time and I know that."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
         text = "I always say, decisions I make, I live with them. There’s always ways you can correct them or ways you can do them better. At the end of the day, I live with them."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
         text = "When you have that gut feeling, you have to go with don’t go back on it."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I think the reason why I am who I am today is because I went through those tough times when I was younger."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I treated it like every day was my last day with a basketball."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "All your life you are told the things you cannot do. All your life they will say you’re not good enough or strong enough or talented enough. They will say you’re the wrong height or the wrong weight or the wrong type to play this or be this or achieve this. They will tell you no. A thousand times no. until all the no’s become meaningless. All your life they will tell you no. Quite firmly and very quickly. And you will tell them yes."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I like criticism. It makes you strong."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Ask me to play, I’ll play. Ask me to shoot, I’ll shoot. Ask me to pass, I’ll pass. Ask me to steal, block out, sacrifice, lead, dominate, anything. But it’s not just what you ask of me. It’s what I ask of myself."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I hear my friends and my mom tell me I’m special, but honestly, I still don’t get it."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I hear that word pressure all the time. There is a lot of pressure put on me, but I don’t put a lot of pressure on myself. I feel if I play my game, it will take care of itself."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Every night on the court I give my all, and if I'm not giving 100 percent, I criticize myself."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "You know, when I have a bad game, it continues to humble me and know that, you know, you still have work to do and you still have a lot of people to impress."
        cats = ["Success", "Sports"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        //J.K. Rowling
        name = "J.K. Rowling"
        
        text = "It is our choices... that show what we truly are, far more than our abilities."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "It is impossible to live without failing at something, unless you live so cautiously that you might as well not have lived at all, in which case you have failed by default."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Anything's possible if you've got enough nerve."
        cats = []
        moos = ["Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "What's coming will come and we'll just have to meet it when it does."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
         text = "It does not do to dwell on dreams and forget to live."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "As is a tale, so is life: not how long it is, but how good it is, is what matters."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "The knowledge that you have emerged wiser and stronger from setbacks means that you are, ever after, secure in your ability to survive."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "We do not need magic to change the world, we carry all the power we need inside ourselves already: we have the power to imagine better."
        cats = ["Change"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "You will never truly know yourself, or the strength of your relationships, until both have been tested by adversity."
        cats = ["Relationships"]
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "It matters not what someone is born, but what they grow to be."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "You’ve got to work. It’s about structure. It’s about discipline. It’s all these deadly things that your schoolteacher told you you needed… You need it."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "You might never fail on the scale I did, but some failure in life is inevitable. It is impossible to live without failing at something, unless you live so cautiously that you might as well not have lived at all - in which case, you fail by default."
        cats = ["Success"]
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Luck can only get you so far."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Wit beyond measure is a man's greatest treasure."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "It was strange how your brain could know what your heart refused to accept."
        cats = ["Relationships"]
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)

        //Beyonce
        name = "Beyonce"
        
        text = "If everything was perfect, you would never learn and you would never grow."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Power means happiness; power means hard work and sacrifice."
        cats = ["Success"]
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "When you love and accept yourself, when you know who really cares about you, and when you learn from your mistakes, then you stop caring about what people who don't know you think."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I can never be safe; I always try and go against the grain. As soon as I accomplish one thing, I just set a higher goal. That's how I've gotten to where I am."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I wanted to sell a million records, and I sold a million records. I wanted to go platinum; I went platinum. I've been working nonstop since I was 15. I don't even know how to chill out."
        cats = ["Success"]
        moos = ["Motivational"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I get nervous when I don't get nervous. If I'm nervous I know I'm going to have a good show."
        cats = ["Success"]
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I truly believe that women should be financially independent from their men. And let’s face it, money gives men the power to run the show. It gives men the power to define value. They define what’s sexy. And men define what’s feminine. It’s ridiculous."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I always try to be myself. Ever since I was an introverted kid, I’d get on stage and be able to break out of my shell."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I love my job, but it’s more than that: I need it."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Strong enough to bear the children. Then get back to business."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I don’t like to gamble, but if there’s one thing I’m willing to bet on, it’s myself."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "The reality is, sometimes you lose."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
         //Connor Mcgregor
        name = "Connor Mcgregor"
        
        text = "Doubt is only removed by action. If you’re not working then that’s where doubt comes in."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        text = "There’s no talent here, this is hard work. This is an obsession. Talent does not exist, we are all equals as human beings. You could be anyone if you put in the time. You will reach the top, and that’s that. I am not talented, I am obsessed."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I have never encountered a winner that held hate towards something."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "It’s not really that much big of a deal – you brush it off and you come back. Defeat is the secret ingredient to success."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I’m just going to keep doing what I’m doing. Keep proving people wrong and proving myself right."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "At the end of the day, you’ve gotta feel some way. So why not feel unbeatable? Why not feel untouchable?"
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I keep having vivid dreams of success. Then it’s time to sleep."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Failure is not an option for me. Success is all I envision."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Excellence is not a skill. Excellence is an attitude."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I stay ready so I don’t have to get ready."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "All that matters is how you see yourself."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Do I hate my opponents? How can I hate someone who has the same dreams as me?"
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "I was always a dreamer, and my first ambition was to be a footballer. I’d be out in the field doing drills after it got dark at night. So I had that passion to get somewhere and a drive to do something. I did love football and was always more into playing it than watching it. When I found combat sport, however, it just took over. It’s non-stop now."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "One king gets old, then a young gorilla comes up and kills him, and takes everything he owns."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Approach everything with an open mind, with a learning mind. You will never stop learning as long as you keep the mind-set that everything works, because everything does work. There’s a time and a place for every single move. If you work on it enough, it will work."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Be grateful with everything you have and you will be successful in everything you do."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "My success isn’t a result of arrogance. It’s a result of belief"
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "Look out for those who look out for you. Loyalty is everything."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "There’s people that focus on the game and forget about the art. There’s that specific individual that can do both."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "You can’t fear success and I think a lot of people do. I think a lot of people fear the really high heights. But I am not one of those people… I’m not like that. I’m going for it."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
        text = "We’re not just here to take part. We’re here to take over."
        cats = ["Success", "Sports"]
        moos = ["Motivational", "Hungry"]
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
                
                
        //Thomas Jefferson
        name = "Thomas Jefferson"
        
        text = "Walking is the best possible exercise. Habituate yourself to walk very far."
        cats = []
        moos = []
        id = iterator
        iterator += 1
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos, _id : id)
        
        
        
    }
    
    func MakeQuote(_name : String, _quote : String, _categories : [String], _moods : [String], _id : Int) -> Void {
        
        var quote = Quote()
        
        quote.person = _name
        quote.text = _quote
        for cat in _categories {
            quote.categories.insert(cat, at: quote.categories.count)
        }
        for mood in _moods {
            quote.moods.insert(mood, at: quote.moods.count)
        }
        quote.id = _id
        try! realm.write {
            realm.add(quote)
        }
    }
    
    
}
