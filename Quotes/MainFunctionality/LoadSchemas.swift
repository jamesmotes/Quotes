//
//  LoadSchemas.swift
//  Quotes
//
//  Created by Blake Nelson on 5/9/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation
import RealmSwift

class LoadSchemas {
    let realm = try! Realm()
    
    init() {
        var imageFile : String = String()
        var fontStyle : String = String()
        // var whiteBackground : Bool = Bool()
        var textColor : UIColor = UIColor()
        var backgroundColor : UIColor = UIColor()
        var schemas = [Schema]()
        
        imageFile = ""
        fontStyle = "Papyrus"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        var schema = Schema()
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)
        
        imageFile = ""
        fontStyle = "Zapfino"
        textColor = UIColor.black
        backgroundColor = UIColor.white
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        imageFile = ""
        fontStyle = "Futura"
        textColor = UIColor.white
        backgroundColor = UIColor.gray
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        imageFile = ""
        fontStyle = "Chalkduster"
        textColor = UIColor.white
        backgroundColor = UIColor.purple
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        imageFile = ""
        fontStyle = "TradeGothic"
        textColor = UIColor.black
        backgroundColor = UIColor.white
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        fontStyle = "Georgia"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "Colorcloud.jpg"
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        fontStyle = "TradeGothic"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "babylion.jpg"
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        fontStyle = "Didot"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "mountain.jpg"
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        fontStyle = "Georgia"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "road.jpg"
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "starrynight.jpg"
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        fontStyle = "Copperplate"
        textColor = UIColor.black
        backgroundColor = UIColor.white
        imageFile = "whitetower.jpg"
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        imageFile = ""
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)

        for schema in schemas {
            try! realm.write {
                realm.add(schema)
            }
        }
        
    }
}
