//
//  QuoteClass.swift
//  Quotes
//
//  Created by James Motes on 2/13/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation
import RealmSwift


final class Quote: Object {
    @objc dynamic var text = ""
    @objc dynamic var person = ""
    let categories = List<String>()
    let moods = List<String>()
    @objc dynamic var favorite = false
    @objc dynamic var downvote = false
    @objc dynamic var custom = false
    @objc dynamic var id = 0
    
    override static func primaryKey() -> String? {
        return "text"
    }
}
