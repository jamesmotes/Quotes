//
//  Quotes.swift
//  MySampleApp
//
//


class Quotes {
    var quotes: [String]
    init (i: Int){
        switch i {
        case 0 :
            quotes = [ "Don't check boxes.",
                        "If you don't know why you're doing something, do something else."
                ]
        case 1 :
            quotes = [ "My mentality is that of a samurai. I would rather commit seppuku than fail.",
                       "When I was in college, I wanted to be involved in things that would change the world."
                ]
        default:
            quotes = []
            print("not in list of people")
        }
    }
}
