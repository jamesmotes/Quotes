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
    @objc dynamic var textColor = NSData()
    @objc dynamic var backgroundColor = NSData()
    
    func getTextColor() -> UIColor? {
        var color: UIColor?
        color = NSKeyedUnarchiver.unarchiveObject(with: textColor as Data) as? UIColor
        return color
    }
    func setTextColor(color: UIColor?) {
        if let color = color {
            textColor = (NSKeyedArchiver.archivedData(withRootObject: color) as NSData?)!
        }
    }
    
    func getBackgroundColor() -> UIColor? {
        var color: UIColor?
        color = NSKeyedUnarchiver.unarchiveObject(with: backgroundColor as Data) as? UIColor
        return color
    }
    func setBackgroundColor(color: UIColor?) {
        if let color = color {
            backgroundColor = (NSKeyedArchiver.archivedData(withRootObject: color) as NSData?)!
        }
    }
    
    
}
