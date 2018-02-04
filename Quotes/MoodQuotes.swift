//
//  MoodQuotes.swift
//  Quotes
//
//  Created by James Motes on 1/18/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation


let moods = ["Happy", "Motivational", "Sad", "Hungry"]


class MoodQuotes {
    var quotes: [String: String]
    init (i: Int){
        switch i {
        case 0 :
            //happy
            quotes = [:]
        case 1 :
            //motivational
            quotes = [:]
        case 2 :
            //sad
            quotes = [:]
        case 3 :
            //hungry
            quotes = [:]
        /*case 4 :
            quotes = [:]
        case 5 :
            quotes = [:]
        case 6 :
            quotes = [:]
 */
        default :
            quotes = [:]
        }

    }
}
