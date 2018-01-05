//
//  CategoryQuotes.swift
//  Quotes
//
//  Created by James Motes on 1/5/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation

class CategoryQuotes {
    var quotes: [String: String]
    init (i: Int){
        switch i {
        case 0 :
            quotes = ["Elon Musk": "My mentality is that of a samurai. I would rather commit seppuku than fail.",
                      "Gary Vaynerchuck": "Stop focusing on dumb shit. Don’t be afraid to break things. Don’t be romantic. Don’t take the time to breathe. Don’t aim for perfect. And whatever you do, keep moving. Reread this a few times . . ."
            ]
        case 1 :
            quotes = ["Brandon Carter": "This is planet earth. Results are the only thing that matters on planet earth."]
        default :
            quotes = [:]
        }
    }
}
