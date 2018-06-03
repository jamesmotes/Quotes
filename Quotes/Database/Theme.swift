//
//  Theme.swift
//  Quotes
//
//  Created by James Motes on 6/3/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

final class Theme: Object {
    @objc dynamic var imageFile = ""
    @objc dynamic var font = ""
    @objc dynamic var whiteBackground = false
    @objc dynamic var textColor = NSData()
    @objc dynamic var backgroundColor = NSData()
    @objc dynamic var image = NSData()
    
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
    
    func setImage(_image: UIImage?) {
        if let _image = _image {
            image = NSData(data: UIImageJPEGRepresentation(_image, 0.9)!)
            //(NSKeyedArchiver.archivedData(withRootObject: _image) as NSData?)!
        }
    }
    
    func getImage() -> UIImage? {
        var _image: UIImage?
        _image = UIImage.init(data: image as Data, scale: 0.9)
            //NSKeyedUnarchiver.unarchiveObject(with: image as Data) as? UIImage
        return _image
    }
    
}
