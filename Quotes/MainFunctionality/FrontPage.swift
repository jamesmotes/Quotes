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
import Foundation
import StoreKit

var pers = ""
var category = ""
var md = ""
var isFavorite = false
var isDownvote = false
var isRandom = false
var personalQuotes = false

var changedFont = false
var globalFontStyle = "System"
var globalFontColor = UIColor.white
var globalBackgroundColor = UIColor.black

class FrontPage: UIViewController , GADInterstitialDelegate {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var person: UILabel!
    
    @IBOutlet weak var createQuoteButton: UIButton!
    @IBOutlet weak var createQuoteImage: UIImageView!
    @IBOutlet weak var deleteQuoteButton: UIButton!
    @IBOutlet weak var deleteQuoteImage: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
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
        
        quotes = Array(realm.objects(Quote.self))
        quotes.shuffle()
        
        if(notificationQuote != "") {
            for j in 0...(quotes.count - 1) {
                if notificationQuote.range(of:(quotes[j].text)) != nil {
                    index = j
                    notificationQuote = ""
                }
            }
        }
        //PurchasesController.shared.uploadReceipt()
        refresh()
        
        print(PurchasesController.shared.currentSessionId)
        let sessionId = PurchasesController.shared.currentSessionId ?? ""
        
        SessionHandler.shared.selfies(for: sessionId) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let selfies):
                full_unlock = true
            case .failure(let error): strongSelf.showErrorAlert(for: error)
            }
            
        }

        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        if(globalImageFile != ""){
            image.image = UIImage(named: globalImageFile)
        }
        else {
            image.image = nil
        }
        
        if(changedFont){
            changedFont = false
            text.textColor = globalFontColor
            var currentSize = 42
            text.font = UIFont(name: globalFontStyle, size: CGFloat(currentSize))
            
            person.textColor = globalFontColor
            currentSize = 25
            person.font = UIFont(name: globalFontStyle, size: CGFloat(currentSize))
            
            createQuoteButton.titleLabel?.textColor = globalFontColor
            deleteQuoteButton.titleLabel?.textColor = globalFontColor
            
            self.view.backgroundColor = globalBackgroundColor
        }
        
        
        if(self.view.backgroundColor == UIColor.white){
            menuButton.setBackgroundImage(#imageLiteral(resourceName: "MenuBlack.png"), for: UIControlState.normal)
            searchButton.setBackgroundImage(#imageLiteral(resourceName: "SearchBlack.png"), for: UIControlState.normal)
            shareButton.setBackgroundImage(#imageLiteral(resourceName: "ShareBlack.png"), for: UIControlState.normal)
        }
        else {
            menuButton.setBackgroundImage(#imageLiteral(resourceName: "MenuWhite.png"), for: UIControlState.normal)
            searchButton.setBackgroundImage(#imageLiteral(resourceName: "SearchWhite.png"), for: UIControlState.normal)
            shareButton.setBackgroundImage(#imageLiteral(resourceName: "ShareWhite.png"), for: UIControlState.normal)
        }
        
        navigationController?.isNavigationBarHidden = true
        if(!didComeFromAdd){
            index = 0
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
        
        if personalQuotes {
            quotes = Array(realm.objects(Quote.self))
            var customQuotes : [Quote] = []
            for q in quotes {
                if q.custom {
                    customQuotes.append(q)
                }
            }
            quotes = customQuotes
            refresh()
            
            //favButton.isHidden = true
            //favButton.isEnabled = false
            
            createQuoteButton.isHidden = false
            createQuoteButton.isEnabled = true
            
            /*createQuoteImage.isHidden = false
             createQuoteImage.layer.borderColor = globalFontColor.cgColor
             createQuoteImage.layer.borderWidth = 3.0
             */
            deleteQuoteButton.isHidden = false
            deleteQuoteButton.isEnabled = true
            /*
             deleteQuoteImage.isHidden = false
             deleteQuoteImage.layer.borderColor = globalFontColor.cgColor
             deleteQuoteImage.layer.borderWidth = 3.0
             */
        }
        else {
            //favButton.isHidden = false
            //favButton.isEnabled = true
            
            createQuoteButton.isHidden = true
            createQuoteButton.isEnabled = false
            
            createQuoteImage.isHidden = true
            
            deleteQuoteButton.isHidden = true
            deleteQuoteButton.isEnabled = false
            
            deleteQuoteImage.isHidden = true
        }
        
        var query : String = ""
        print(category)
        if pers != "" {
            query += "person = '" + pers + "'"
        }
        else if category != "" {
            var checkQuotes = Array(realm.objects(Quote.self))//.filter(category + " IN %@", ))
            if(category != "General"){
                var remove : [Int] = [Int]()
                quotes = []
                for i in 0...(checkQuotes.count - 1) {
                    let string = checkQuotes[i].categories
                    if (checkQuotes[i].categories.contains(category)){
                        quotes.append(checkQuotes[i])
                    }
                }/*
                 for i in 0...(remove.count-1){
                 quotes.remove(at: remove.count-i-1)
                 }*/
                //print(quotes)
            }
            else {
                quotes = checkQuotes
            }
            //query += ""
            
            //var filterThis = quotes.filter(category + "IN categories")
            
            //self.registeredUsers = self.realm.objects(AppUser.self).filter("email != %@ && NOT (email IN %@)", self.user.email, memberEmails)
            /*var remove : [Int] = [Int]()
            quotes = []
            for i in 0...(checkQuotes.count - 1) {
                let string = checkQuotes[i].categories
                if (checkQuotes[i].categories.contains(category)){
                    quotes.append(checkQuotes[i])
                }
            }/*
            for i in 0...(remove.count-1){
                quotes.remove(at: remove.count-i-1)
            }*/
            */
            //print(quotes)
            quotes.shuffle()
            refresh()
            return
        }
        else if isFavorite {
            query += "favorite = true"
        }
        else if isDownvote {     // Possibly remove when downvote functionality actually works
            query += "downvote = false"
        }
        
        else if isRandom {
            query = ""
            quotes = Array(realm.objects(Quote.self))
            quotes.shuffle()
            refresh()
        }
        else if selectedSpecificQuote {
            query = "text CONTAINS '" + specificQuote + "'"
        }
        
        
        print("Query: \(query)")
        if query != "" {
            quotes = Array(realm.objects(Quote.self).filter(query))
            quotes.shuffle()
            refresh()
        }
        query = ""
        refresh()
    }

    func refresh(){
        //display ads every 12 quotes
        if interstitial.isReady && scrolls > 11 {
            print("Time for add")
            print(index)
            interstitial.present(fromRootViewController: self)
            scrolls = 0
            didComeFromAdd = true
        }
        
        //if query or menu option is empty
        if(quotes.count < 1){
            self.text.text = "No quotes available :("
            self.person.text = "- gb&j"
        }
        else {
            print(index)
            self.text.text = quotes[index].text
            self.person.text = "- " + quotes[index].person
            if(!quotes[index].favorite){
                self.favButton.tintColor = UIColor.white
            }
            else {
                self.favButton.tintColor = UIColor.orange
            }
        }
        print(index)
    }
    
   
    @IBAction func createCustomQuote(_ sender: Any) {
        performSegue(withIdentifier: "createQuote", sender: nil)
    }
    
    @IBAction func deleteQuote(_ sender: Any) {
        let query : String = "id == " + String(quotes[index].id)
        let theQuote = realm.objects(Quote.self).filter(query).first
        try! realm.write {
            realm.delete(theQuote!)
        }
        showAfterMenu()
        refresh()
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
    
    @IBAction func search(_ sender: Any) {
        

        guard PurchasesController.shared.currentSessionId != nil,
            PurchasesController.shared.hasReceiptData else {
                performSegue(withIdentifier: "unlockSegueFront", sender: nil)
                return
        }
        full_unlock = true
        performSegue(withIdentifier: "goToSearch", sender: nil)
 
        return
        if(!full_unlock) {
            performSegue(withIdentifier: "unlockSegueFront", sender: nil)
        }
        else {
            performSegue(withIdentifier: "goToSearch", sender: nil)
        }
    }
    
    private func showErrorAlert(for error: ServiceError) {
        let title: String
        let message: String
        switch error {
        case .missingAccountSecret:
            title = "Account Secret Not Configured"
            message = "You missed a step and did not add your iTunes Connect Account Secret, search in the tutorial for \"YOUR_ACCOUNT_SECRET\" for more info."
        case .invalidSession:
            title = "Invalid Session"
            message = "Please go back and try again or relaunch the app."
        case .noActiveSubscription:
            title = "No Active Subscription"
            message = "Please verify that you have an active subscription or sign up for a new one."
        case .other(let otherError):
            title = "Unexpected Error"
            message = otherError.localizedDescription
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let backAction = UIAlertAction(title: "Back", style: .default) { (_) in
            _ = self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(backAction)
        //present(alert, animated: true, completion: nil)
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
