//
//  LoadThemes2.swift
//  Quotes
//
//  Created by James Motes on 9/23/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import Foundation

//
//  LoadThemes.swift
//  Quotes
//
//  Created by James Motes on 6/3/18.
//  Copyright © 2018 JDM. All rights reserved.
//


import Foundation
import RealmSwift


class LoadThemes2 {
    let realm = try! Realm()
    
    init() {
        var imageFile : String = String()
        var fontStyle : String = String()
        // var whiteBackground : Bool = Bool()
        var textColor : UIColor = UIColor()
        var backgroundColor : UIColor = UIColor()
        
        
        
        imageFile = "Bridge.JPG"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "ChainBridge.JPG"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "CliffDiving.JPG"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "DowntownNYC.JPG"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "Forest.JPG"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "HandSunset.JPG"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "Lightning.JPG"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "OceanSunset.JPG"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "PalmOut.JPG"
        fontStyle = "Copperplate"
        textColor = UIColor.white
        backgroundColor = UIColor.black
        addTheme(imageFile: imageFile, fontStyle: fontStyle, textColor: textColor, backgroundColor: backgroundColor)
        
        imageFile = "TreeDiving.JPG"
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
        
        deleteTheme(imageFile: "babylion.jpg")
        deleteTheme(imageFile: "City.jpg")
        
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
        
        let query = "imageFile CONTAINS '" + imageFile + "'"
        let themes = Array(realm.objects(Theme.self).filter(query))
        
        if(themes.count < 1){
            do {
                try realm.write {
                    realm.add(theme)
                    numBackgrounds += 1
                }
            }
            catch {
                print("Error loading Background")
            }
        }
    }
    
    func deleteTheme(imageFile: String){
        let query = "imageFile CONTAINS '" + imageFile + "'"
        let themes = Array(realm.objects(Theme.self).filter(query))
        if(themes.count > 1){
            do {
                try realm.write {
                    realm.delete(themes[0])
                }
            }
            catch{
                print("Error deleting theme")
            }
        }
    }
    
}

