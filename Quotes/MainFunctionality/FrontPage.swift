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

var changedFont = true
//var globalFontStyle = "Georgia"
//var globalFontColor = UIColor.white
//var globalBackgroundColor = UIColor.black

//var whiteBackground = false

class FrontPage: UIViewController , GADInterstitialDelegate {

    var sharing = false
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var person: UILabel!
    
    @IBOutlet weak var createQuoteButton: UIButton!
    @IBOutlet weak var createQuoteImage: UIImageView!
    @IBOutlet weak var deleteQuoteButton: UIButton!
    @IBOutlet weak var deleteQuoteImage: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBlack: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var menuBlack: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shareBlack: UIButton!
    
    let realm = try! Realm()
    
    var quotes : [Quote] = []
    
    var index = 0
    
    var interstitial: GADInterstitial!
    
    var scrolls = 0
    
    var didComeFromAdd = false
    
    override func viewDidLoad() {
        setSchema()
        super.viewDidLoad()
        
        
        
        interstitial = createAndLoadInterstitial()
        interstitial.delegate = self
        
        let request = GADRequest()
        interstitial.load(request)
        
        quotes = Array(realm.objects(Quote.self))
        quotes.shuffle()
        
        
        //PurchasesController.shared.uploadReceipt()
        if(!sharing || !changedFont){
            refresh()
        }else{
            sharing = false
            changedFont = false
        }
        
        //print(PurchasesController.shared.currentSessionId)
        let sessionId = PurchasesController.shared.currentSessionId ?? ""
        
        SessionHandler.shared.selfies(for: sessionId) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let _):
                full_unlock = true
            case .failure(let error): strongSelf.showErrorAlert(for: error)
            }
        }
    }
    
    func setSchema(){
        if(globalSchema.imageFile != ""){
            image.image = UIImage(named: globalSchema.imageFile)
        }
        else {
            image.image = nil
            view.backgroundColor = globalSchema.getBackgroundColor()
        }
        if(changedFont){
            changedFont = false
            text.textColor = globalSchema.getTextColor()
            var currentSize = 42
            text.font = UIFont(name: globalSchema.font, size: CGFloat(currentSize))
            
            person.textColor = globalSchema.getTextColor()
            currentSize = 25
            person.font = UIFont(name: globalSchema.font, size: CGFloat(currentSize))
            
            createQuoteButton.setTitleColor(globalSchema.getTextColor(), for: .normal)
            deleteQuoteButton.setTitleColor(globalSchema.getTextColor(), for: .normal)
            
            self.view.backgroundColor = globalSchema.getBackgroundColor()
        }
        
        
        if(globalSchema.whiteBackground){
            menuBlack.isHidden = false
            searchBlack.isHidden = false
            shareBlack.isHidden = false
            
            menuButton.isHidden = true
            searchButton.isHidden = true
            shareButton.isHidden = true
        }
        else {
            menuBlack.isHidden = true
            searchBlack.isHidden = true
            shareBlack.isHidden = true
            
            menuButton.isHidden = false
            searchButton.isHidden = false
            shareButton.isHidden = false
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        checkSubscription()
        if(notificationQuote != "") {
            quotes = Array(realm.objects(Quote.self))
            var found = false
            for j in 0...(quotes.count - 1) {
                if notificationQuote.range(of:(quotes[j].text)) != nil {
                    index = j
                    found = true
                    //notificationQuote = ""
                }
            }
            if(!found){
                print(notificationQuote)
                let char : Character = "-"
                var check : Substring = Substring()
                var quote : Substring = Substring()
                
                
                for i in 1...notificationQuote.count{//-1 {
                    var nameIndex = notificationQuote.index(notificationQuote.endIndex, offsetBy: (-1)*i)
                    check = notificationQuote[nameIndex...]
                    if(check.contains(char)){
                        nameIndex = notificationQuote.index(notificationQuote.endIndex, offsetBy: (-1)*i - 2)
                        quote = notificationQuote[...nameIndex]
                        break
                    }
                }
                
                let checkString = String(check)
                let nameIndex = checkString.index(checkString.startIndex, offsetBy: 2)
                let name = String(checkString[nameIndex...])
                let quoteString = String(quote)
                print(quote)
                let newQuote : Quote = Quote()
                newQuote.person = name
                newQuote.text = quoteString
                newQuote.id = quoteIterator
                quoteIterator = quoteIterator + 1
                let defaults = UserDefaults.standard
                defaults.set(quoteIterator, forKey: "quoteIterator")
                try! realm.write {
                    realm.add(newQuote)
                }
                quotes.append(newQuote)
                index = quotes.count - 1
            }
        }
        refresh()
        
        
        navigationController?.isNavigationBarHidden = true
        if(didComeFromAdd || changedFont || sharing){
            didComeFromAdd = false
        }
        else {
            if(notificationQuote == ""){
                index = 0
            }
            else {
                notificationQuote = ""
            }
            showAfterMenu()
        }
        setSchema()
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
            
            
            deleteQuoteButton.isHidden = true
            deleteQuoteButton.isEnabled = false
            
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
            var charIndex = specificQuote.startIndex
            var partials : [String] = []
            var remainingQuote = specificQuote
            for i in 0...specificQuote.count-1 {
                print(specificQuote)
                charIndex = specificQuote.index(specificQuote.startIndex, offsetBy: i)
                let check = specificQuote[charIndex]
                print(check)
                if(check == "\'"){
                    charIndex = specificQuote.index(specificQuote.startIndex, offsetBy: i-1)
                    partials.append(String(remainingQuote[...charIndex]))
                    charIndex = specificQuote.index(specificQuote.startIndex, offsetBy: i+1)
                    remainingQuote = String(specificQuote[charIndex...])
                }
                if(i == specificQuote.count - 1){
                    partials.append(remainingQuote)
                }
            }
            //specificQuote = (specificQuote as NSString).replacingOccurrences(of: "\'", with: "'")
            /*if(partials.count < 1){
                query = "text CONTAINS '" + specificQuote + "'"
            }
            else {
                for p in partials {
                    query = query + "AND text CONTAINS '" + p + "'"
                }
            }*/
            query = "text CONTAINS '" + partials[0] + "'"
            if(partials.count > 1){
                for i in 1...partials.count-1 {
                    query = query + " AND text CONTAINS '" + partials[i] + "'"
                }
            }
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
        if (interstitial.isReady && scrolls > 11 && !full_unlock){
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
                if(globalSchema.whiteBackground){
                    self.favButton.tintColor = UIColor.lightGray
                }
                else {
                    self.favButton.tintColor = UIColor.white
                }
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
        sharing = true
        let activityVC = UIActivityViewController(activityItems: [screenShotMethod(), self.text.text! + " " + self.person.text!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func screenShotMethod() -> UIImage{
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        
        
        createQuoteButton.isHidden = true
        deleteQuoteButton.isHidden = true
        menuBlack.isHidden = true
        searchBlack.isHidden = true
        shareBlack.isHidden = true
        
        menuButton.isHidden = true
        searchButton.isHidden = true
        shareButton.isHidden = true
        favButton.isHidden = true
        
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        //UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        favButton.isHidden = false
        setSchema()
        return image!
    }
    
    
    @IBAction func search(_ sender: Any) {
        if(DEVELOPMENT){
            performSegue(withIdentifier: "goToSearch", sender: nil)
        }

        guard PurchasesController.shared.currentSessionId != nil,
            PurchasesController.shared.hasReceiptData else {
                performSegue(withIdentifier: "unlockSegueFront", sender: nil)
                return
        }
        full_unlock = true
        performSegue(withIdentifier: "goToSearch", sender: nil)
 
        return/*
        if(!full_unlock) {
            performSegue(withIdentifier: "unlockSegueFront", sender: nil)
        }
        else {
            performSegue(withIdentifier: "goToSearch", sender: nil)
        }*/
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
        var interstitial : GADInterstitial
        if(DEVELOPMENT){
            //test add
            interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        } else {
            //the real deal
            interstitial = GADInterstitial(adUnitID: "ca-app-pub-1816441460162466/7954976526")
        }
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
    }
    
    /// Tells the delegate an ad request succeeded.
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("interstitialDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func checkSubscription(){
        guard PurchasesController.shared.currentSessionId != nil,
            PurchasesController.shared.hasReceiptData else {
                full_unlock = false
                return
        }
        full_unlock = true
    }
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
