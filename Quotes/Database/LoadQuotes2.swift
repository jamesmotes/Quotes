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
        
        name = "Tim Ferriss"
        
        text = "What we fear doing most is usually what we most need to do."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You are the average of the five people you associate with most, so do not underestimate the effects of your pessimistic, unambitious, or disorganized friends. If someone isn’t making you stronger, they’re making you weaker."
        cats = ["Success", "Entrepreneur", "Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A person’s success in life can usually be measured by the number of uncomfortable conversations he or she is willing to have."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The question you should be asking isn’t, “What do I want?” or “What are my goals?” but “What would excite me?"
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you are insecure, guess what? The rest of the world is, too. Do not overestimate the competition and underestimate yourself. You are better than you think."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The opposite of love is indifference, and the opposite of happiness is boredom."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The fishing is best where the fewest go and the collective insecurity of the world makes it easy for people to hit home runs while everyone is aiming for base hits."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life is too short to be small."
        cats = ["Success", "Entrepreneur", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Many a false step was made by standing still."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The goal is not to simply eliminate the bad, but to pursue and experience the best in the world."
        cats = ["Success", "Entrepreneur", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Focus on being productive instead of being busy."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        text = "$1,000,000 in the bank isn’t the fantasy. The fantasy is the lifestyle of complete freedom it supposedly allows."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s lonely at the top. Ninety-nine percent of people in the world are convinced they are incapable of achieving great things, so they aim for the mediocre. The level of competition is thus fiercest for ‘realistic’ goals, paradoxically making them the most time and energy-consuming."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It is predicated on the assumption that you dislike what you are doing during the most physically capable years of your life. This is a nonstarter—nothing can justify that sacrifice."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Someday is a disease that will take your dreams to the grave with you."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Being able to quit things that don’t work is integral to being a winner."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "People are fond of using the its not what you know, its who you know adage as an excuse for inaction, as if all successful people are born with powerful friends."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you let pride stop you, you will hate life."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never automate something that can be eliminated, and never delegate something that can be automated or streamlined. Otherwise, you waste someone else’s time instead of your own, which now wastes your hard-earned cash."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        
        name = "Daymond John"
        
        text = "Don’t wait for the perfect time, you will wait forever. Always take advantage of the time that you’re given and make it perfect."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Align yourself with the right people, forge the right relationships and you’ll set yourself up for the long run."
        cats = ["Success", "Entrepreneur", "Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We all want the freedom to make our own decisions."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Learn as many mistakes and what not to do while your business or product is small. Don’t be in such a hurry to grow your brand. Make sure that you and the market can sustain any bumps that may occur down the road."
        cats = ["Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If I’ve learned one thing in this life it’s this: even if you lose, don’t lose the lesson."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You become what you think about the most."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If people haven’t laughed at your dreams, then you aren’t dreaming big enough, just keep pushing forward."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Everyone has an idea, but it’s taking those first steps toward turning that idea into a reality that are always the toughest."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success is waking up every day and doing what you want to do."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you aren’t living your dreams then you’re living your fears."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Make it. Master it. Matter."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "John D. Rockefeller"
        text = "If you want to succeed you should strike out on new paths, rather than travel the worn paths of accepted success."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t be afraid to give up the good and go for the great."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Perseverance can overcome all obstacles. Even the laws of nature cannot stop it."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I always tried to turn every disaster into an opportunity."
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A friendship founded on business is better than a business founded on friendship."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If your only goal is to become rich, you will never achieve it."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The road to happiness lies in two simple principles; find what it is that interests you and that you can do well, and when you find it put your whole soul into it every bit of energy and ambition and natural ability you have."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The secret of success is to do the common things uncommonly well."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Singleness of purpose is one of the chief essentials for success in life, no matter what may be one’s aim."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I had no ambition to make a fortune. Mere money-making has never been my goal, I had an ambition to build."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Think of giving not as a duty but as a privilege."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Jim Rohn"
        
        text = "Discipline is the bridge between goals and accomplishment."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Happiness is not something you postpone for the future; it is something you design for the present."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You must take personal responsibility. You cannot change the circumstances, the seasons, or the wind, but you can change yourself. That is something you have charge of."
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don't sepnd major time on minor things."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you don’t design your own life plan, chances are you’ll fall into someone else’s plan. And guess what they have planned for you? Not much."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You are the average of the five people you spend the most time with."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I find it fascinating that most people plan their vacations with better care than they plan their lives. Perhaps that is because escape is easier than change"
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Formal education will make you a living; self-education will make you a fortune."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Those who will not read are no better off than those who cannot read."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There are two types of pain you will go through in life, the pain of discipline and the pain of regret. Discipline weighs ounces while regret weighs tonnes."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You have two choices: You can make a living, or you can design a life."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Motivation is what gets you started. Habit is what keeps you going."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t wish it was easier, wish you were better. Don’t wish for less problems, wish for more skills. Don’t wish for less challenge, wish for more wisdom."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t join an easy crowd; you won’t grow. Go where the expectations and the demands to perform are high."
        cats = ["Success", "Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Learn how to be happy with what you have while you pursue all that you want."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Profits are better than wages. Wages make you a living; profits make you a fortune."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you want to be a leader who attracts quality people, the key is to become a person of quality yourself."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Without a sense of urgency, desire loses its value."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You cannot change your destination overnight. But you can change your direction."
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Your life does not get better by chance, it gets better by change."
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you are not willing to risk the unusual, you will have to settle for the ordinary."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You cannot make progress without making decisions."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The few who do are the envy of the many who watch."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success is what you attract by the person you become."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Unless you change how you are, you will always have what you got."
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you know what you want, and want it bad enough, you will find a way to get it."
        cats = ["Success", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success is doing ordinary things extraordinarily well."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Let others lead small lives, but not you. Let others argue over small things, but not you. Let others cry over small hurts, but not you. Let others leave their future in someone else’s hands, but not you."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success is nothing more than a few simple disciplines, practiced every day."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We must be careful not to let our current appetites steal away any chance we might have for a future feast."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Learn to work harder on yourself than you do on your job." 
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Either you run the day or the day runs you."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you don’t like how things are, change it! You’re not a tree."
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Les Brown"
        
        text = "Don’t let someone else’s opinion become your reality."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Shoot for the moon, because even if you miss, you’ll land among the stars."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you take responsibility for yourself you will develop a hunger to accomplish your dream."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Too many of us are not living our dreams because we are living our fears."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you don’t program yourself, life will program you."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The people that want to step into their greatness are hungry."
        cats = ["Success", "Les Brown"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Most people fail in life not because they aim too high and miss, but because they aim too low and hit."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life takes on meaning when you become motivated, set goals and charge after them in an unstoppable manner."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Help others achieve their dreams and you will achieve yours."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life is a fight for territory and once you stop fighting for what you want, what you don’t want will automatically take over."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s not over until I win."
        cats = ["Success", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You must be willing to do what others won’t do, to have what others won’t have."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I don’t know what you’re up against, I don’t know what you’re facing. But here’s what I do know: You’ve got something special, you’ve got greatness in you, and I know it’s possible that you can live your dream."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The greatest revenge is massive success."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "People inspire you, or they drain you. Pick them wisely."
        cats = ["Success", "Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you set goals and go after them with all the determination you can muster, your gifts will take you places that will amaze you."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Act the way you want to be and soon you’ll be the way you act."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You must remain focused on your journey to greatness."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Align yourself with people you can learn from, people who want more out of life, people who are stretching and searching and seeking some higher ground in life."
        cats = ["Success", "Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You are the only real obstacle in your path to a fulfilling life."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It takes someone with a vision of the possibilities to attain new levels of experience. Someone with the courage to live his dreams."
        cats = ["Success", "Entrepreneur"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When your why is big enough you will find your how."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "As you reach your goals set new ones. That is how you grow and become a more powerful person."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You must see your goals clearly and specifically before you can set out for them. Hold them in your mind until they become second nature."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life has no limitations except the ones you make."
        cats = ["Success", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Accept responsibility for your life. Know that it is you who will get you where you want to go, no one else."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Robert H. Schuller"
        
        text = "Problems are not stop signs, they are guidelines."
        cats = ["Success", "Empowerment", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I'd rather attempt to do something great and fail than to attempt to do nothing and succeed."
        cats = ["Success", "Empowerment", "Motivational", "Entrepreneur", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Let your hopes, not your hurts, shape your future."
        cats = ["Success", "Empowerment", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Failure doesn't mean you are a failure it means you haven't succeeded yet."
        cats = ["Success", "Change", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Spectacular achievement is always preceded by unspectacular preparation."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Never underestimate your problem or your ability to deal with it."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Some people are at the top of the ladder, some are in the middle, still more are at the bottom, and a whole lot more don't even know there is a ladder."
        cats = ["Success", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Today's accomplishments were yesterday's impossibilities."
        cats = ["Success", "Change", "Empowerment", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Most people who succeed in the face of seemingly impossible conditions are people who simply don't know how to quit."
        cats = ["Success", "Empowerment", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you listen to your fears, you will die never knowing what a great person you might have been."
        cats = ["Success", "Empowerment", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If there exists no possibility of failure, then victory is meaningless."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Better to do something imperfectly than to do nothing perfectly."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Winning starts with beginning."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Press on. Obstacles are seldom the same size tomorrow as they are today."
        cats = ["Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You will suddenly realize that the reason you never changed before was because you didn't want to."
        cats = ["Success", "Change", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Eric Thomas"
        
        text = "When you want to succeed as bad as you want to breathe, then you’ll be successful."
        cats = ["Success", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Everybody wants to be a beast, until it’s time to do what real beasts do."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Pain is temporary. It may last for a minute, or an hour or a day, or even a year. But eventually, it will subside. And something else take its place. If I quit, however, it will last forever."
        cats = ["Success", "Motivational", "Hungry", "Fitness"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Don’t make a habit out of choosing what feels good over what’s actually good for you."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Avoid being your own enemy."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The difference between those who succeed and fail: not taking advantage of opportunities."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Things change for the better when we take responsibility for our own thoughts, decisions and actions. "
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You are the executive director and screenwriter of your life."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Most of you don’t want success as much as you want to sleep!"
        cats = ["Success", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "At some point in life you have to face your fears."
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success is never on discount! Greatness is never on sale! Greatness is never half off! It’s all or nothing! It’s all day, every day! Greatness is never on discount!"
        cats = ["Success", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Stop the blame game. Stop! Stop looking out the window and look in the mirror!"
        cats = ["Success", "Change"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s realizing that a great dream is not as good as a great memory. The dream can be had by anyone. The memory – must be made."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Sometimes it ain’t about being the most talented. Sometimes it ain’t about being the smartest. Sometimes it’s not even about working the hardest. Sometimes it’s about consistency! Consistency!"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "What you envision in your mind, how you see yourself, and how you envision the world around you is of great importance because those things become your focus."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success is not for the weak and uncommitted… Sometimes it’s gonna hurt!"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Both desire and imagination are stored in the mind of the individual and when stretched, both have the potential to position a person for greatness."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I use pain to push me to greatness."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you’re not where you are. If you’re not where you want to be. If you don’t have what you want, want to have. If you’re not where you think you should be at this particular place. It has nothing to do with the system, but it has everything to do with the fact that you’re not making the sacrifice."
        cats = ["Success", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The only way to get out of mediocrity is to keep shooting for excellence."
        cats = ["Success", "Change", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’ve been trying to tell y’all, it’s not your circumstances or situation, that determines if you gonna be successful or not. I’ve been telling you it’s your mindset! It’s the way you see it. It’s the way you think it right!"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Everybody has a dream, but not everybody has a grind."
        cats = ["Success", "Motivational", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Winners focus on winning. Losers focus on winners."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You can’t cheat the grind, it knows hows much you’ve invested, it won’t give you nothing you haven’t worked for"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you’re going to go to your next level, your values are going to have to change."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "No alarm clock needed, my passion wakes me."
        cats = ["Success", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Stop being average. You’re not even good. You were born to be great."
        cats = ["Success", "Motivational"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s not easy, but it’s simple."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Stop whining, start grinding."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "At the end of pain is success."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Be stronger than your excuses."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = " Apply the ABC’s of success to your life. Ask, Believe and Claim It."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Fall in love with the process and the results will come"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Greatness is upon you, you better act like it."
        cats = ["Success", "Motivational", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’ve got a dream that’s worth more than my sleep."
        cats = ["Success", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’m gonna make the rest of my life, the best of my life."
        cats = ["Success", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Look in the mirror, that’s your competition."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "You ain’t average! But you know what? You’re playing small because it’s easier to be average."
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The problem is, you get more excited talking about it, than you do when you actually doing it!"
        cats = ["Success"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "When you’re great! You attract great! When you’re average! You attract average."
        cats = ["Success", "Relationships"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        name = "Vince Lombardi"
        
        text = "The price of success is hard work, dedication to the job at hand, and the determination that whether we win or lose, we have applied the best of ourselves to the task at hand."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Winning isn’t everything, but wanting to win is."
        cats = ["Success", "Sports", "Hungry"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The quality of a person’s life is in direct proportion to their commitment to excellence, regardless of their chosen field of endeavor."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Individual commitment to a group effort, that is what makes a team work."
        cats = ["Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "In great attempts, it is glorious even to fail."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s not whether you get knocked down, it’s whether you get up."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Once a man has made a commitment to a way of life, he puts the greatest strength in the world behind him. It’s something we call heart power. Once a man has made this commitment, nothing will stop him short of success."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Leaders are made, they are not born. They are made by hard effort, which is the price which all of us must pay to achieve any goal that is worthwhile."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I firmly believe that any man’s finest hour, the greatest fulfillment of all that he holds dear, is the moment when he has worked his heart out in a good cause and lies exhausted on the field of battle, victorious."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The only place success comes before work is in the dictionary."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Inches make champions."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The greatest accomplishment is not in never falling, but in rising again after you fall."
        cats = ["Success", "Sports", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The real glory is being knocked to your knees and then coming back. That’s real glory. That’s the essence of it."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Life’s battles don’t always go to the stronger or faster man. But sooner or later, the man who wins is the man who thinks he can."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Winning is a habit. Unfortunately, so is losing."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "There’s only one way to succeed in anything, and that is to give it everything."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Some of us will do our jobs well and some will not, but we will be judged by only one thing-the result."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "The spirit, the will to win, and the will to excel are the things that endure. These qualities are so much more important than the events that occur."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "It’s easy to have faith in yourself and have discipline when you’re a winner, when you’re number one. What you’ve got to have is faith and discipline when you’re not yet a winner."
        cats = ["Success", "Sports", "Empowerment"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I would say that the quality of each man’s life is the full measure of that man’s commitment of excellence and victory – whether it be football, whether it be business, whether it be politics or government or what have you."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Success is like anything worthwhile. It has a price. You have to pay the price to win and you have to pay the price to get to the point where success is possible. Most important, you must pay the price to stay there."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "A man can be as great as he wants to be. If you believe in yourself and have the courage, the determination, the dedication, the competitive drive, and if you are willing to sacrifice the little things in life and pay the price for the things that are worthwhile, it can be done."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If you’ll not settle for anything less than your best, you will be amazed at what you can accomplish in your lives."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "We would accomplish many more things if we did not think of them as impossible."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Second place is meaningless."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "Winning is a habit. Watch your thoughts, they become your beliefs. Watch your beliefs, they become your words. Watch your words, they become your actions. Watch your actions, they become your habits. Watch your habits, they become your character."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "If it doesn’t matter who wins or loses, then why do they keep score?"
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "All right Mister, let me tell you what winning means… you’re willing to go longer, work harder, give more than anyone else."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        text = "I’m not afraid to die – it’s just that I had so much left to do in this world."
        cats = ["Success", "Sports"]
        moos = []
        MakeQuote(_name: name, _quote: text, _categories: cats, _moods: moos)
        
        
        
        
        
        
       

    }
    
    
    
}
