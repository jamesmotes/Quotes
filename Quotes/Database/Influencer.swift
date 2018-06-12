//
//  Influencer.swift
//  Quotes
//
//  Created by James Motes on 6/4/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class Influencer {
    var name : String = ""
    var insta : String = ""
    var twitter : String = ""
    var youtube : String = ""
    var website : String = ""
    var imageURL : String = ""
    var image : UIImage = UIImage()
}

final class InfluencerImage: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var imageData : NSData = NSData()
    
    func setImage(_image: UIImage?) {
        if let _image = _image {
            imageData = NSData(data: UIImageJPEGRepresentation(_image, 0.9)!)
            //(NSKeyedArchiver.archivedData(withRootObject: _image) as NSData?)!
        }
    }
    
    func getImage() -> UIImage? {
        var _image: UIImage?
        _image = UIImage.init(data: imageData as Data, scale: 0.9)
        //NSKeyedUnarchiver.unarchiveObject(with: image as Data) as? UIImage
        return _image
    }
    
}
