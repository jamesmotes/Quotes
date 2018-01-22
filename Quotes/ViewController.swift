//
//  ViewController.swift
//  Quotes
//
//  Created by James Motes on 12/26/17.
//  Copyright © 2017 JDM. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth


var dict = ["James Motes": true, "Elon Musk": true, "Blake Nelson": true, "Thomas Jefferson": false, "DJ Khaled": true, "Gary Vaynerchuck": true, "Brandon Carter": true, "Barack Obama": true, "LeBron James": true, "J.K. Rowling": true, "Beyonce": true, "Gabriel Wang": false]
var array = ["James Motes", "Elon Musk", "Blake Nelson", "Thomas Jefferson", "DJ Khaled", "Gary Vaynerchuck", "Brandon Carter", "Barack Obama", "LeBron James", "J.K. Rowling", "Beyonce", "Gabriel Wang"]
var locked = ["Thomas Jefferson": "thomas_jefferson", "Gabriel Wang": "gabriel_wang"]


var backgrounds = ["city_stack.jpg",
                    "dancing_girl.jpg",
                    "snowy_mountains.jpg",
                    "milky_way.jpg",
                    "forest_road.jpg",
                    "volcano_opening.jpg",
                    "painted_dude.jpg",
                    "coffee_mason_jar.jpg",
                    "mirrored_city.jpg",
                    "flower_girl.jpg",
                    "black_umbrella.jpg",
                    "hoodie_red_smoke.jpg"
                    ]

var person : Int = Int()
var cat : Int = Int()
var mood : Int = Int()



var ref : DatabaseReference!

class ViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
        
    @IBOutlet weak var favButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    var labels = ["People", "Categories", "Favorites", "Settings", "Mood", "Random"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //randQuote.adjustsFontSizeToFitWidth = true
        refresh()
        initIAP()
        
        
        dict["Gabriel Wang"] = false
        dict["Gary Vaynerchuck"] = true
        dict["Brandon Carter"] = true
        dict["Barack Obama"] = true
        dict["LeBron James"] = true
        dict["J. K. Rowling"] = true
        dict["Beyonce"] = true
        
        navigationController?.navigationBar.barTintColor = UIColor.clear

    }
    
    override func viewWillAppear(_ animated: Bool) {
        refresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMenu(_ sender: Any) {
        if leadingConstraint.constant == 100{
            leadingConstraint.constant = 0
            trailingConstraint.constant = trailingConstraint.constant - 100
        } else {
            leadingConstraint.constant = 100
            trailingConstraint.constant = trailingConstraint.constant + 100
        }
    }
    
    @IBAction func swipeRight(_ sender: Any) {
        refresh()
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        refresh()
    }
    
    func refresh(){
        let per = arc4random_uniform(_: UInt32(array.count))
        let Quote = PeopleQuotes(i:Int(per))
        let quo = arc4random_uniform(_: UInt32(Quote.quotes.count))
        
//        if(dict[array[Int(per)]] == true){
//            randQuote.text = Quote.quotes[Int(quo)]
//            randPerson.text = "- " + array[Int(per)]
//
//            if favorites.keys.contains(String(describing: randQuote.text!)) {
//                favButton.tintColor = UIColor.orange
//            }
//            else {
//                favButton.tintColor = UIColor.darkGray
//            }
//        }
//        else {
//            refresh()
//        }
        
        
    }
    
    @IBAction func clickedFavoriteButton(_ sender: Any) {
//        if(favButton.tintColor == UIColor.orange){
//            favorites.removeValue(forKey: String(describing: randQuote.text!))
//            favButton.tintColor = UIColor.darkGray
//        }
//        else {
//            favorites[String(describing: randQuote.text!)] = String(describing: randPerson.text!.dropFirst(2))
//            favButton.tintColor = UIColor.orange
//        }
    }
    
    func initIAP(){
        InAppPurchases.shared.getProducts()
        //InAppPurchases.shared.restorePurchases()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MainMenuViewCell
        
        cell.cellLabel.text = labels[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
}

