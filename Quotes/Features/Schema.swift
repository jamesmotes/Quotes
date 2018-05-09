//
//  Schema.swift
//  Quotes
//
//  Created by Blake Nelson on 5/9/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

final class Schema: Object {
    @objc dynamic var imageFile = ""
    @objc dynamic var font = ""
    @objc dynamic var whiteBackground = false
    @objc dynamic var textColor = UIColor()
    @objc dynamic var backgroundColor = UIColor()
    
}
