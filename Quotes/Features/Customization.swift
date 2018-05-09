//
//  Customization.swift
//  Quotes
//
//  Created by Blake Nelson on 4/21/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

var justChanged = false

var hasImage = true
var globalImageFile = "Colorcloud.jpg"

class Customization: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //var collectionView: UICollectionView?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FontCell
        
        // Configure the cell
        
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
        
        if(!full_unlock && indexPath.row > 5){
            cell.lockImage.isHidden = false
        }
        
        //cell.sizeThatFits(CGSize(width: collectionView.frame.width/3.1, height: collectionView.frame.width/3.1))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(!full_unlock && indexPath.row > 5){
            performSegue(withIdentifier: "fontsToPurchase", sender: nil)
            return
        }
        
        
        
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
        changedFont = true
        justChanged = true
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
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
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        collectionViewFlowLayout.minimumLineSpacing = 10
        
        collectionViewFlowLayout.itemSize = CGSize(width: collectionView.frame.width/3.7, height: collectionView.frame.width/3.7)
        
        checkSubscription()
        
        // Do any additional setup after loading the view.
        
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
