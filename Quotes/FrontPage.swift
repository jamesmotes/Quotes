//
//  FrontPage.swift
//  Quotes
//
//  Created by James Motes on 2/13/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import RealmSwift
import GoogleMobileAds

var pers = ""
var category = ""
var md = ""
var isFavorite = false
var isDownvote = false
var isRandom = false

class FrontPage: UIViewController , GADInterstitialDelegate {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var person: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    
    let realm = try! Realm()
    
    var quotes : [Quote] = []
    
    var index = 0
    
    var interstitial: GADInterstitial!
    
    var scrolls = 0
    
    var didComeFromAdd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interstitial = createAndLoadInterstitial()
        
        let request = GADRequest()
        interstitial.load(request)
        
        //navigationController?.isNavigationBarHidden = true
        //favButton.tintColor = UIColor.white
        
        quotes = Array(realm.objects(Quote.self))
        quotes.shuffle()
        refresh()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        index = 0
        if(!didComeFromAdd){
            showAfterMenu()
        }
        else {
            didComeFromAdd = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAfterMenu() {
        var query : String = ""
        print(category)
        if pers != "" {
            query += "person = '" + pers + "'"
        }
        if category != "" {
            if query != "" {
                query += " AND "
            }
            query += "" // TODO: How do you filter based on items in a list?
            quotes = Array(realm.objects(Quote.self))//.filter(category + " IN %@", ))
            //var filterThis = quotes.filter(category + "IN categories")
            
            //self.registeredUsers = self.realm.objects(AppUser.self).filter("email != %@ && NOT (email IN %@)", self.user.email, memberEmails)
            var remove : [Int] = [Int]()
            for i in 0...(quotes.count - 1) {
                if !quotes[i].categories.contains(category){
                    remove.append(i)
                }
            }
            for i in 0...(remove.count-1){
                quotes.remove(at: remove.count-i)
            }
            quotes.shuffle()
            //print(quotes)
            refresh()
        }
        if md != "" {
            if query != "" {
                query += " AND "
            }
            query += "" // TODO: How do you filter based on items in a list?
            
            quotes = Array(realm.objects(Quote.self))//.filter(category + " IN %@", ))
            //var filterThis = quotes.filter(category + "IN categories")
            
            //self.registeredUsers = self.realm.objects(AppUser.self).filter("email != %@ && NOT (email IN %@)", self.user.email, memberEmails)
            var remove : [Int] = [Int]()
            for i in 0...(quotes.count - 1) {
                if !quotes[i].moods.contains(md){
                    remove.append(i)
                }
            }
            for i in 0...(remove.count-1){
                quotes.remove(at: remove.count-i)
            }
            quotes.shuffle()
            //print(quotes)
            refresh()
        }
        if isFavorite {
            if query != "" {
                query += " AND "
            }
            query += "favorite = true"
        }
        if isDownvote {     // Possibly remove when downvote functionality actually works
            if query != "" {
                query += " AND "
            }
            query += "downvote = false"
        }
        
        if isRandom {
            query = ""
            quotes = Array(realm.objects(Quote.self))
            quotes.shuffle()
            refresh()
        }
        
        print("Query: \(query)")
        if query != "" {
            quotes = Array(realm.objects(Quote.self).filter(query))
            //print(quotes)
            quotes.shuffle()
            refresh()
        }
        query = ""
    }

    func refresh(){
        //display ads every 12 quotes
        if interstitial.isReady && scrolls > 11 {
            interstitial.present(fromRootViewController: self)
            scrolls = 0
            didComeFromAdd = true
        } else {
            print("Ad wasn't ready")
        }
        
        //if query or menu option is empty
        if(quotes.count < 1){
            self.text.text = "No quotes available :("
            self.person.text = "- gb&j"
        }
        else {
            self.text.text = quotes[index].text
            self.person.text = "- " + quotes[index].person
            if(!quotes[index].favorite){
                self.favButton.tintColor = UIColor.white
            }
            else {
                self.favButton.tintColor = UIColor.orange
            }
        }
    }
    

    @IBAction func swipedLeft(_ sender: Any) {
        if(index > 0){
            index -= 1
        }
        else {
            index = quotes.count - 1
        }
        scrolls += 1
        print("swipedLeft")
        refresh()
    }
    
    @IBAction func swipedRight(_ sender: Any) {
        if(index < quotes.count - 1){
            index += 1
        }
        else {
            index = 0
        }
        scrolls += 1
        print("swipedRight")
        refresh()
    }
    
    @IBAction func favorite(_ sender: Any) {
        let realm = try! Realm()
        let query : String = "id == " + String(quotes[index].id)
        var theQuote = realm.objects(Quote.self).filter(query).first
        try! realm.write {
            if(theQuote?.favorite)!{
                theQuote!.favorite = false
                quotes[index].favorite = false
                self.favButton.tintColor = UIColor.white
                if isFavorite {
                    quotes.remove(at: index)
                }
            }
            else {
                quotes[index].favorite = true
                theQuote!.favorite = true
                self.favButton.tintColor = UIColor.yellow
            }
        }
        theQuote = realm.objects(Quote.self).filter("favorite == true").first
        refresh()
    }
    
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.text.text! + " " + self.person.text!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        //the real deal
        //var interstitial = GADInterstitial(adUnitID: "ca-app-pub-1816441460162466~7930915740")
        //test add
        var interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
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


extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
