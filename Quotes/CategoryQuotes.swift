//
//  CategoryQuotes.swift
//  Quotes
//
//  Created by James Motes on 1/5/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation


let categories = ["Change", "Success","Entrepreneur", "Fitness", "Relationships", "Sports", /*"Death"*/]


class CategoryQuotes {
    var quotes: [String: String]
    init (i: Int){
        switch i {
        case 0 :
            //change
            quotes = ["If you get up in the morning and think the future is going to be better it is a bright day. Otherwise, it's not.":"Elon Musk",
                "We’re changing the world and changing history, and you either commit or you don’t.":"Elon Musk",
                "If you're walking down the right path and you're willing to keep walking, eventually you'll make progress.":"Barack Obama",
                "Change will not come if we wait for some other person or some other time. We are the ones we've been waiting for. We are the change that we seek.":"Barack Obama",
                "Focusing your life solely on making a buck shows a poverty of ambition. It asks too little of yourself, and it will leave you unfulfilled.":"Barack Obama",
                "Where you are right now doesn't have to determine where you'll end up.":"Barack Obama",
                "Change is never easy but always possible.":"Barack Obama",
                "We don't ask you to believe in our ability to bring change, rather, we ask you to believe in yours.":"Barack Obama",
                "Progress will come in fits and starts. It's not always a straight line. It's not always a smooth path.":"Barack Obama",
                "One voice can change a room.":"Barack Obama",
                "Making your mark on the world is hard. If it were easy, everybody would do it. But it's not. It takes patience, it takes commitment and it comes with plenty of failure along the way.":"Barack Obama",
                "We did not come here to fear the future. We came here to shape it.":"Barack Obama",
                "Our destiny is not written for us, but by us.":"Barack Obama",
                "We do not need magic to change the world, we carry all the power we need inside ourselves already: we have the power to imagine better.":"J. K. Rowling" ,
                "It matters not what someone is born, but what they grow to be.":"J. K. Rowling" ,
                "I use the negativity to fuel the transformation into a better me.":"Beyonce",
                "The more you seek the uncomfortable, the more you will become comfortable.":"Conor McGregor"
                    ]
        case 1 :
            //success
            quotes = ["My mentality is that of a samurai. I would rather commit seppuku than fail.":"Elon Musk",
                "When something is important enough, you do it even if the odds are not in your favor.":"Elon Musk",
                "I think it is possible for ordinary people to choose to be extraordinary.":"Elon Musk",
                "The first step is to establish that something is possible; then probability will occur.":"Elon Musk",
                "Being an entrepreneur is like eating glass and staring into the abyss of death.":"Elon Musk",
                "When somebody has a breakthrough innovation, it is rarely one little thing. Very rarely, is it one little thing. It's usually a whole bunch of things that collectively amount to a huge innovation.":"Elon Musk",
                "Complaining is a zero return investment.":"Gary Vaynerchuck",
                "I'm grinding when you're sleeping.":"Gary Vaynerchuck",
                "I'm not worried about getting boo'd in the third quarter. Talk to me after the game.":"Gary Vaynerchuck",
                "If you're not dreaming big for yourself, who's going to do it for you?":"Gary Vaynerchuck",
                "This is planet earth. Results are the only thing that matters on planet earth.":"Brandon Carter",
                "You got to take responsibility for your own success. Regardless of your circumstances.":"Brandon Carter",
                "That's how you're going to be judged. On what you produce, or what you don't.":"Brandon Carter",
                "Don't worry about what he has. What do you have? What are you going to do to be successful? What are you going to do to accomplish your goals?":"Brandon Carter",
                "Some people may have some advantages that you don't have. You may have to work harder than them... So work harder than them!":"Brandon Carter",
                "Today I want you to promise yourself that you're done making excuses forever. You're done. You're going to set goals and you're going to accomplish them no matter what stands in your way.":"Brandon Carter",
                "No matter how many times you fall down, you're going to get back up. You're going to keep going. You're going to keep pushing.":"Brandon Carter",
                "You have to have extreme actions to have extreme results.":"Brandon Carter",
                "If you're walking down the right path and you're willing to keep walking, eventually you'll make progress.":"Barack Obama",
                "The future rewards those who press on. I don't have time to feel sorry for myself. I don't have time to complain. I'm going to press on.":"Barack Obama",
                "You can't let your failures define you. You have to let your failures teach you.":"Barack Obama",
                "Where you are right now doesn't have to determine where you'll end up.":"Barack Obama",
                "Progress will come in fits and starts. It's not always a straight line. It's not always a smooth path.":"Barack Obama",
                "We need to internalize this idea of excellence. Not many folks spend a lot of time trying to be excellent.":"Barack Obama",
                "If you work hard and meet your responsibilities, you can get ahead, no matter where you come from, what you look like or who you love.":"Barack Obama",
                "Making your mark on the world is hard. If it were easy, everybody would do it. But it's not. It takes patience, it takes commitment and it comes with plenty of failure along the way.":"Barack Obama",
                "All your life they will tell you no. Quite firmly and very quickly. And you will tell them yes.":"LeBron James",
                "It is impossible to live without failing at something, unless you live so cautiously that you might as well not have lived at all, in which case you have failed by default.":"J. K. Rowling",
                "Anything's possible if you've got enough nerve.":"J. K. Rowling",
                "The knowledge that you have emerged wiser and stronger from setbacks means that you are, ever after, secure in your ability to survive.":"J. K. Rowling",
                "I can never be safe; I always try and go against the grain. As soon as I accomplish one thing, I just set a higher goal. That's how I've gotten to where I am.":"Beyonce",
                "You can’t fear success and I think a lot of people do. I think a lot of people fear the really high heights. But I am not one of those people… I’m not like that. I’m going for it.":"Conor McGregor",
                "Success tends to spend the most time with those that pay it the most attention.":"Grant Cardone",
                "As long as you are alive, you will either live to accomplish your own goals and dreams or be used as a resource to accomplish someone else's":"Grant Cardone",
                "If you want to be in the 1% it’s simple, don’t do what the 99% do.":"Grant Cardone"

                        ]
        case 2 :
            //entrepenuer
            quotes = [
                /*"Stop focusing on dumb shit.*/ "Don’t be afraid to break things. Don’t be romantic. Don’t take the time to breathe. Don’t aim for perfect. And whatever you do, keep moving. Reread this a few times . . .":"Gary Vaynerchuck",
                "I think that's the single best piece of advice: constantly think about how you could be doing things better and questioning yourself.":"Elon Musk",
                "There's a silly notion that failure's not an option at NASA. Failure is an option here. If things are not failing, you are not innovating enough.":"Elon Musk",
                "I'm interested in things that change the world or that affect the future and wondrous, new technology where you see it, and you're like, 'Wow, how did that even happen? How is that possible?'":"Elon Musk",
                "I don't create companies for the sake of creating companies, but to get things done.":"Elon Musk",
                "I could either watch it happen or be a part of it.":"Elon Musk",
                "I don't think it's a good idea to plan to sell a company.":"Elon Musk",
                "If you're co-founder or CEO, you have to do all kinds of tasks you might not want to do... If you don't do your chores, the company won't succeed... No task is too menial.":"Elon Musk",
                "Starting and growing a business is as much about the innovation, drive, and determination of the people behind it as the product they sell.":"Elon Musk",
                "If you're not dreaming big for yourself, who's going to do it for you?":"Gary Vaynerchuck"
            ]
        case 3 :
            //fitness
            quotes = ["This is planet earth. Results are the only thing that matters on planet earth.":"Brandon Carter",
            ]
        case 4 :
            //relationships
            quotes = ["You will never truly know yourself, or the strength of your relationships, until both have been tested by adversity.":"J. K. Rowling"

                    ]
        case 5 :
            //sports
            quotes = ["I’m going to use all my tools, my god-given ability, and make the best life I can with it.":"LeBron James",
                "Dream as if you’ll live forever. Live as if you’ll die today.":"LeBron James",
                "You can’t be afraid to fail. It’s the only way you succeed. You’re not gonna succeed all the time and I know that.":"LeBron James",
                "I always say, decisions I make, I live with them. There’s always ways you can correct them or ways you can do them better. At the end of the day, I live with them.":"LeBron James",
                "When you have that gut feeling, you have to go with don’t go back on it.":"LeBron James",
                "Ask me to play, I’ll play. Ask me to shoot, I’ll shoot. Ask me to pass, I’ll pass. Ask me to steal, block out, sacrifice, lead, dominate, anything. But it’s not just what you ask of me. It’s what I ask of myself.":"LeBron James",
                "I hear my friends and my mom tell me I’m special, but honestly, I still don’t get it.":"LeBron James",
                "I hear that word pressure all the time. There is a lot of pressure put on me, but I don’t put a lot of pressure on myself. I feel if I play my game, it will take care of itself.":"LeBron James",
                "Every night on the court I give my all, and if I'm not giving 100 percent, I criticize myself.":"LeBron James",
                "You know, when I have a bad game, it continues to humble me and know that, you know, you still have work to do and you still have a lot of people to impress.":"LeBron James",
                "Doubt is only removed by action. If you’re not working then that’s where doubt comes in.":"Conor McGregor",
                "There’s no talent here, this is hard work. This is an obsession. Talent does not exist, we are all equals as human beings.":"Conor McGregor",
                "You could be anyone if you put in the time. You will reach the top, and that’s that. I am not talented, I am obsessed.":"Conor McGregor",
                "I have never encountered a winner that held hate towards something.":"Conor McGregor",
                "It’s not really that much big of a deal – you brush it off and you come back. Defeat is the secret ingredient to success.":"Conor McGregor",
                "I’m just going to keep doing what I’m doing. Keep proving people wrong and proving myself right.":"Conor McGregor",
                "At the end of the day, you’ve gotta feel some way. So why not feel unbeatable? Why not feel untouchable?":"Conor McGregor",
                "I keep having vivid dreams of success. Then it’s time to sleep.":"Conor McGregor",
                "Excellence is not a skill. Excellence is an attitude.":"Conor McGregor",
                "Do I hate my opponents? How can I hate someone who has the same dreams as me?":"Conor McGregor",
                "One king gets old, then a young gorilla comes up and kills him, and takes everything he owns.":"Conor McGregor",
                "Approach everything with an open mind, with a learning mind. You will never stop learning as long as you keep the mind-set that everything works, because everything does work.":"Conor McGregor",
                "There’s a time and a place for every single move. If you work on it enough, it will work.":"Conor McGregor",
                "My success isn’t a result of arrogance. It’s a result of belief.":"Conor McGregor",
                "There’s people that focus on the game and forget about the art. There’s that specific individual that can do both.":"Conor McGregor",
                "Winner focus on winning. Losers focus on winners.":"Conor McGregor",
                "Always look to learn. Learning something new is a great feeling. The feeling of progress.":"Conor McGregor",
                "I am cocky in prediction. I am confident in preparation. But I am always humble in victory or defeat.":"Conor McGregor"
                    ]
        /*case 6 :
            //death
            quotes = [:]*/
        default :
            quotes = [:]
        }
    }
}
