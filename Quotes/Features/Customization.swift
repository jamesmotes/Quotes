//
//  Customization.swift
//  Quotes
//
//  Created by Blake Nelson on 4/21/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import RealmSwift

var justChanged = false

var deleteOption = false

var hasImage = true
//var globalImageFile = "Colorcloud.jpg"

//var globalSchema : Schema = Schema()
var globalTheme : Theme = Theme()


var loadedImage : UIImage = UIImage()

class Customization: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let realm = try! Realm()
    var array : [Theme] = []
    
    
    //var collectionView: UICollectionView?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FontCell
        
        // Configure the cell
        /*
        var backgroundColor = UIColor.black
        
        var fontStyle : String = String()
        var textColor = UIColor.white
        var imageFile = ""
        
        switch(indexPath.row){
        case 0:
            fontStyle = "Papyrus"
            textColor = UIColor.white
            backgroundColor = UIColor.black
        case 1:
            fontStyle = "Zapfino"
            textColor = UIColor.black
            backgroundColor = UIColor.white
        case 2:
            fontStyle = "Futura"
            textColor = UIColor.white
            backgroundColor = UIColor.gray
        case 3:
            fontStyle = "Chalkduster"
            textColor = UIColor.white
            backgroundColor = UIColor.purple
        case 4:
            fontStyle = "TradeGothic"
            textColor = UIColor.black
            backgroundColor = UIColor.white
        case 5:
            fontStyle = "Georgia"
            textColor = UIColor.white
            backgroundColor = UIColor.black
            imageFile = "Colorcloud.jpg"
        case 6:
            fontStyle = "TradeGothic"
            textColor = UIColor.white
            backgroundColor = UIColor.black
            imageFile = "babylion.jpg"
        case 7:
            fontStyle = "Didot"
            textColor = UIColor.white
            backgroundColor = UIColor.black
            imageFile = "mountain.jpg"
        case 8:
            fontStyle = "Georgia"
            textColor = UIColor.white
            backgroundColor = UIColor.black
            imageFile = "road.jpg"
        case 9:
            fontStyle = "Copperplate"
            textColor = UIColor.white
            backgroundColor = UIColor.black
            imageFile = "starrynight.jpg"
        case 10:
            fontStyle = "Copperplate"
            textColor = UIColor.black
            backgroundColor = UIColor.white
            imageFile = "whitetower.jpg"
        default :
            fontStyle = "Symbol"
            textColor = UIColor.white
            backgroundColor = UIColor.black
        }
        */
        /*
        if(imageFile != ""){
            let im : UIImage = UIImage(named: imageFile)!
            cell.image.image = im
            hasImage = true
        }
        else {
            hasImage = false
        }
        
        cell.name.font = UIFont(name: fontStyle, size: 15)
        cell.quote.font = UIFont(name: fontStyle, size: 35)
        cell.name.textColor = textColor
        cell.quote.textColor = textColor
        
        cell.backgroundColor = backgroundColor
        */
        if(array[indexPath.row].imageFile != ""){
            let imageFile = array[indexPath.row].imageFile
            let im : UIImage = UIImage(named: imageFile)!
            cell.image.image = im
            hasImage = true
        }
        else {
            cell.image.image = nil
            hasImage = false
        }
        
        cell.image.image = array[indexPath.row].getImage()
        
        cell.name.font = UIFont(name: array[indexPath.row].font, size: 15)
        cell.quote.font = UIFont(name: array[indexPath.row].font, size: 35)
        cell.name.textColor = array[indexPath.row].getTextColor()
        cell.quote.textColor = array[indexPath.row].getTextColor()
        
        cell.backgroundColor = array[indexPath.row].getBackgroundColor()
        
        if((!full_unlock && indexPath.row > 6) || (indexPath.row == 0 && !full_unlock)){
            cell.lockImage.isHidden = false
        }
        else {
            cell.lockImage.isHidden = true
        }
        /*if(indexPath.row >= numBackgrounds){
            cell.delete = true
            cell.lockImage.image = UIImage(named: "DeleteIconBlack.png")
        }*/
        
        if(indexPath.row == 0){
            cell.quote.text = ""
            cell.name.text = ""
            cell.backgroundColor = UIColor.black
            cell.image.backgroundColor = UIColor.black
        }
        
        //cell.sizeThatFits(CGSize(width: collectionView.frame.width/3.1, height: collectionView.frame.width/3.1))
        if(deleteOption && indexPath.row > 0){
            cell.shakeIcons()
        }
        else {
            cell.stopShakingIcons()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(deleteOption && indexPath.row > 0){
            let theme = array[indexPath.row]
            do {
                try realm.write {
                    realm.delete(theme)
                }
            }
            catch {
                print("Error deleting theme")
            }
            array.remove(at: indexPath.row)
            collectionView.reloadData()
            return
        }
        
        if(!full_unlock && (indexPath.row > 6 || indexPath.row == 0)){
            performSegue(withIdentifier: "fontsToPurchase", sender: nil)
            return
        }
        
        
        /*
        switch(indexPath.row){
        case 0:
            globalFontStyle = "Papyrus"
            globalFontColor = UIColor.white
            globalBackgroundColor = UIColor.black
            whiteBackground = false
            globalImageFile = ""
        case 1:
            globalFontStyle = "Zapfino"
            globalFontColor = UIColor.black
            globalBackgroundColor = UIColor.white
            whiteBackground = true
            globalImageFile = ""
        case 2:
            globalFontStyle = "Futura"
            globalFontColor = UIColor.white
            globalBackgroundColor = UIColor.gray
            whiteBackground = false
            globalImageFile = ""
        case 3:
            globalFontStyle = "Chalkduster"
            globalFontColor = UIColor.white
            globalBackgroundColor = UIColor.purple
            whiteBackground = false
            globalImageFile = ""
        case 4:
            globalFontStyle = "TradeGothic"
            globalFontColor = UIColor.black
            globalBackgroundColor = UIColor.white
            whiteBackground = true
            globalImageFile = ""
        case 5:
            globalFontStyle = "Georgia"
            globalFontColor = UIColor.white
            globalBackgroundColor = UIColor.black
            whiteBackground = false
            globalImageFile = "Colorcloud.jpg"
        case 6:
            globalFontStyle = "TradeGothic"
            globalFontColor = UIColor.white
            globalBackgroundColor = UIColor.black
            whiteBackground = false
            globalImageFile = "babylion.jpg"
        case 7:
            globalFontStyle = "Didot"
            globalFontColor = UIColor.white
            globalBackgroundColor = UIColor.black
            whiteBackground = false
            globalImageFile = "mountain.jpg"
        case 8:
            globalFontStyle = "Georgia"
            globalFontColor = UIColor.white
            globalBackgroundColor = UIColor.black
            whiteBackground = false
            globalImageFile = "road.jpg"
        case 9:
            globalFontStyle = "Copperplate"
            globalFontColor = UIColor.white
            globalBackgroundColor = UIColor.black
            whiteBackground = false
            globalImageFile = "starrynight.jpg"
        case 10:
            globalFontStyle = "Copperplate"
            globalFontColor = UIColor.black
            globalBackgroundColor = UIColor.white
            whiteBackground = true
            globalImageFile = "whitetower.jpg"
        default :
            globalFontStyle = "System"
            globalFontColor = UIColor.white
            globalBackgroundColor = UIColor.black
            whiteBackground = false
        }
        */

        if(indexPath.row == 0){
            let customImage = UIImagePickerController()
            customImage.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            
            customImage.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            customImage.allowsEditing = false
            
            self.present(customImage, animated: true){
                
            }
            
            
        }
        else {
            globalTheme = array[indexPath.row]
            changedFont = true
            justChanged = true
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            loadedImage = image
            
            
            self.dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "loadCustomImage", sender: nil)
        }
        else {
            print("got problems with image loading")
            self.dismiss(animated: true, completion: nil)
        }
        //self.dismiss(animated: true, completion: nil)
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
        let imageName = "customImage" + String(imageCount)
        let imagePath = self.saveImage(imageName: imageName)
        
        print(imagePath)
        
        var customTheme : Theme = Theme()
        customTheme.imageFile = imagePath + "//" + imageName
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
    }
    
    @objc func handleLongPress(gestureRecognizer : UILongPressGestureRecognizer){
        
        if (gestureRecognizer.state != UIGestureRecognizerState.began){
            return
        }
        
        let p = gestureRecognizer.location(in: self.collectionView)
        
        if let indexPath : IndexPath = (self.collectionView?.indexPathForItem(at: p))! {
            print(indexPath)
            if(deleteOption){
                deleteOption = false
            }
            else {
                deleteOption = true
            }
            collectionView.reloadData()
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        /*collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView!)
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let anchor : NSLayoutYAxisAnchor = backButton.bottomAnchor
        
        collectionView?.topAnchor.constraint(equalTo: anchor).isActive = true
        
        collectionView?.backgroundColor = UIColor.white
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        
        collectionView?.register(FontCell.self, forCellWithReuseIdentifier: "cell")
        //collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "topCell")
        */
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        
        collectionView.backgroundColor = UIColor.black
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.minimumInteritemSpacing = 6
        collectionViewFlowLayout.minimumLineSpacing = 6
        //collectionViewFlowLayout.minimumLineSpacing = collectionViewFlowLayout.minimumLineSpacing
        
        collectionViewFlowLayout.itemSize = CGSize(width: view.frame.width/3 - 6, height: view.frame.width/3 - 6)
        
        
        //checkSubscription()
        
        
        
        array = Array(realm.objects(Theme.self))
        collectionView.reloadData()
        
        let lpgr : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(Customization.handleLongPress(gestureRecognizer:)))
        lpgr.minimumPressDuration = 0.5
        lpgr.delegate = self
        lpgr.delaysTouchesBegan = true
        self.collectionView?.addGestureRecognizer(lpgr)
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
        deleteOption = false
        if(savedImage == true){
            dismiss(animated: true, completion: nil)
            savedImage = false
        }
    }
    
    func setTheme(){
        view.backgroundColor = globalTheme.getBackgroundColor()
        if(globalTheme.whiteBackground){
            backButton.setImage(UIImage(named: "BackButtonBlack.png"), for: .normal)
            collectionView.backgroundColor = UIColor.black
        } else {
            backButton.imageView?.image = UIImage(named: "BackButtonWhite.png")
            collectionView.backgroundColor = UIColor.white
        }
    }
    
    func checkSubscription(){
        guard PurchasesController.shared.currentSessionId != nil,
            PurchasesController.shared.hasReceiptData else {
                full_unlock = false
                return
        }
        full_unlock = true
    }
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->CGSize {
        //let width = (UIScreen.main.bounds.size.width)/3
        //let height = width
        return CGSize(width: collectionView.frame.width/3.1, height: collectionView.frame.width/3.1)
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
