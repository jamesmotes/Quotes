//
//  LoadThemes.swift
//  Quotes
//
//  Created by James Motes on 6/3/18.
//  Copyright © 2018 JDM. All rights reserved.
//


import Foundation
import RealmSwift

var imageIterator = 0

class LoadThemes {
    let realm = try! Realm()
    
    init() {
        var imageFile : String = String()
        var fontStyle : String = String()
        // var whiteBackground : Bool = Bool()
        var textColor : UIColor = UIColor()
        var backgroundColor : UIColor = UIColor()
        
        imageFile = "photo.png"
        fontStyle = "System"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = ""
        fontStyle = "Papyrus"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = ""
        fontStyle = "Zapfino"
        textColor = UIColor.black
        backgroundColor = UIColor.white
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = ""
        fontStyle = "Futura"
        textColor = UIColor.white
        backgroundColor = UIColor.gray
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = ""
        fontStyle = "Chalkduster"
        textColor = UIColor.white
        backgroundColor = UIColor.purple
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = ""
        fontStyle = "TradeGothic"
        textColor = UIColor.black
        backgroundColor = UIColor.white
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        fontStyle = "Georgia"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "Colorcloud.jpg"
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        fontStyle = "TradeGothic"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "babylion.jpg"
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        fontStyle = "Didot"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "mountain.jpg"
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        fontStyle = "Georgia"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "road.jpg"
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        imageFile = "starrynight.jpg"
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        fontStyle = "Copperplate"
        textColor = UIColor.black
        backgroundColor = UIColor.white
        imageFile = "whitetower.jpg"
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        /*
         imageFile = "basketballcourt.jpg"
         fontStyle = "Copperplate"
         textColor = UIColor.white
         backgroundColor = UIColor.black
         addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
         */
        imageFile = "City.jpg"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "colorhallway.jpg"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        /*imageFile = "towerdown.jpg"
         fontStyle = "Copperplate"
         textColor = UIColor.white
         backgroundColor = UIColor.black
         addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
         */
        imageFile = "whitemountain.jpg"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "aurora.jpg"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        /*
         imageFile = "butterfly.jpg"
         fontStyle = "Symbol"
         textColor = UIColor.white
         backgroundColor = UIColor.black
         addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
         */
        /*
         imageFile = "clouds.jpg"
         fontStyle = "Copperplate"
         textColor = UIColor.white
         backgroundColor = UIColor.black
         addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
         */
        imageFile = "colorsky.jpg"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "desertwalk.jpg"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "ferriswheel.jpg"
        fontStyle = "Copperplate"
        textColor = UIColor.black
        backgroundColor = UIColor.white
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "fyah.jpg"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "hotair.jpg"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "tempestuousocean.jpg"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
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
    
    func addTheme(imageFile : String, fontStyle : String, textColor : UIColor, backgroundColor : UIColor){
        
        let theme = Theme()
        
        if(imageFile != ""){
            let inputImage = UIImage(named: imageFile)
            theme.setImage(_image: inputImage)
        }
        
        theme.font = fontStyle
        theme.setTextColor(color: textColor)
        theme.setBackgroundColor(color: backgroundColor)
        if(backgroundColor == UIColor.white){
            theme.whiteBackground = true
        }
        else {
            theme.whiteBackground = false
        }
        try! realm.write {
            realm.add(theme)
        }
    }
    
}

