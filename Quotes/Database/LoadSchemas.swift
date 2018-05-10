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
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = ""
        fontStyle = "Zapfino"
        textColor = UIColor.black
        backgroundColor = UIColor.white
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = ""
        fontStyle = "Futura"
        textColor = UIColor.white
        backgroundColor = UIColor.gray
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)

        imageFile = ""
        fontStyle = "Chalkduster"
        textColor = UIColor.white
        backgroundColor = UIColor.purple
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)

        imageFile = ""
        fontStyle = "TradeGothic"
        textColor = UIColor.black
        backgroundColor = UIColor.white
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)

        fontStyle = "Georgia"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "Colorcloud.jpg"
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)

        fontStyle = "TradeGothic"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "babylion.jpg"
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)

        fontStyle = "Didot"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "mountain.jpg"
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)

        fontStyle = "Georgia"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "road.jpg"
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)

        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "starrynight.jpg"
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)

        fontStyle = "Copperplate"
        textColor = UIColor.black
        backgroundColor = UIColor.white
        imageFile = "whitetower.jpg"
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        /*imageFile = "basketballcourt.png"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
 
        imageFile = "City.jpg"
        fontStyle = "System"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
 
        imageFile = "colorhallway.jpg"
        fontStyle = "System"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "towerdown.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "whitemountain.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        */
        imageFile = "aurora.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "butterfly.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "clouds.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "colorsky.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "desertwalk.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "ferriswheel.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "fyah.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "hotair.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
 
        imageFile = "tempestuousocean.jpg"
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addSchema(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
 
/*
        imageFile = ""
        fontStyle = "Symbol"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.textColor = textColor
        schema.backgroundColor = backgroundColor
        schemas.append(schema)
 */
        
        // TODO: Rename schema to theme
        // TODO: Pull schemas to create global schema object
        // TODO: query all schemas/themes in customization view
    }
    
    func addSchema(imageFile : String, fontStyle : String, textColor : UIColor, backgroundColor : UIColor){
        
        var schema = Schema()
        schema.imageFile = imageFile
        schema.font = fontStyle
        schema.setTextColor(color: textColor)
        schema.setBackgroundColor(color: backgroundColor)
        try! realm.write {
            realm.add(schema)
        }
    }
    
}
