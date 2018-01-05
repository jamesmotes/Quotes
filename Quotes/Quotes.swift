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
        default:
            quotes = []
            print("not in list of people")
        }
    }
}
