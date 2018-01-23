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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MainMenuCell
        cell.cellLabel.text = mainMenu[indexPath.item]
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

}
