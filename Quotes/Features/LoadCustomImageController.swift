//
//  LoadCustomImageController.swift
//  Quotes
//
//  Created by James Motes on 5/31/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import RealmSwift

var savedImage = false

var uploadedImage : UIImage = UIImage()
var didUploadImage = false

class LoadCustomImageController: UIViewController{
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var saveBackground: UIImageView!
    
    let realm = try! Realm()
    var array : [Theme] = []
    
    var imageFile = ""
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = loadedImage
        saveBackground.layer.borderColor = globalTheme.getTextColor()?.cgColor
        saveBackground.layer.borderWidth = 3.0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            loadedImage = image
        }
        else {
            print("got problems with image loading")
        }
    }
    
    func saveImage(imageName: String) -> String{
        let fileManager = FileManager.default
        
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        let data = UIImagePNGRepresentation(loadedImage)
        
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        
        return imagePath
    }
    
    func selectedImage(){
        let imageCount = self.array.count
        imageName = "customImage" + String(imageCount)
        let imagePath = self.saveImage(imageName: imageName)
        
        print(imagePath)
        imageFile = imagePath + "/" + imageName
        print(imageFile)
    }
    
    @IBAction func clickedBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func pressedSave(_ sender: Any) {
        //selectedImage()
        
        var customTheme : Theme = Theme()
        //customTheme.imageFile = imageFile
        
        customTheme.setImage(_image: image.image)
        
        customTheme.font = "Copperplate"
        customTheme.setTextColor(color: UIColor.white)
        customTheme.setBackgroundColor(color: UIColor.black)
        customTheme.whiteBackground = false
        try! self.realm.write {
            self.realm.add(customTheme)
        }
        globalTheme = customTheme
        changedFont = true
        justChanged = true
        
        
        
        savedImage = true
        //dismiss(animated: true, completion: nil)
        
        
        didUploadImage = true
        uploadedImage = image.image!
        dismiss(animated: true, completion: nil)
        //image.image = UIImage(named: imageName)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
