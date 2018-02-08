//
//  MainMenuViewController.swift
//  Quotes
//
//  Created by Blake Nelson on 1/22/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    let mainMenu = ["People", "Categories", "Mood", "Favorites", "Random", "Settings"]
    let cellSpacing:CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dict["Gabriel Wang"] = false
        dict["Conor McGregor"] = true
        InAppPurchases.shared.getProducts()
        

        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MainMenuCell
        
        // Design cell as necessary
        cell.cellLabel.text = mainMenu[indexPath.item]  // Label text
        cell.layer.borderColor = UIColor.black.cgColor  // Border color
        cell.layer.borderWidth = 1                      // Border width
        cell.layer.cornerRadius = 12                    // Rounded corners
        
        
        
        
        
        cell.cellLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        cell.cellLabel.minimumScaleFactor = 0.5
        cell.cellLabel.numberOfLines = 1
        cell.cellLabel.adjustsFontSizeToFitWidth = true
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            performSegue(withIdentifier: "menuToPeople", sender: nil)
        case 1:
            performSegue(withIdentifier: "menuToCategories", sender: nil)
        case 2:
            performSegue(withIdentifier: "menuToMood", sender: nil)
        case 3:
            performSegue(withIdentifier: "menuToFavorites", sender: nil)
        case 4:
            performSegue(withIdentifier: "menuToRandom", sender: nil)
        case 5:
            performSegue(withIdentifier: "menuToSettings", sender: nil)
        default:
            print("none selected")
        }
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let spacing = self.view.frame.size.width
        return CGSize(width: 0.5*spacing, height: 0.5*spacing)
    }

}
