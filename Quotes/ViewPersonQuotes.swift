//
//  ViewPersonQuotes.swift
//  Quotes
//
//  Created by James Motes on 1/5/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit


var didPurchase = false

class ViewPersonQuotes: UIViewController {

    var quotes = PeopleQuotes(i: -1)
    var it = 0;
    
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var unlockPerson: UIButton!
    
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    @IBOutlet var swipeRight: UISwipeGestureRecognizer!
    @IBOutlet var swipeLeft: UISwipeGestureRecognizer!
    @IBOutlet var doubleTap: UITapGestureRecognizer!
    //@IBOutlet weak var backgroundView: UIImageView!
    
    
    
    var purchasesController: PurchasesControllerProtocol = PurchasesController(withProductIDs: ["thomas_jefferson", "gabriel_wang"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quote.adjustsFontSizeToFitWidth = true
        navigationController?.navigationBar.barTintColor = UIColor.clear
        
        //view.addVerticalGradientLayer(topColor: UIColor.lightGray, bottomColor: UIColor.black)
        
        if(dict[array[person]] == true) {
            quotes = PeopleQuotes(i: person)
            //unlockPerson.isHidden = true
            refresh()
        }
        else {
            NotificationCenter.default.addObserver(self, selector: #selector(self.personPurchased),name:NSNotification.Name(rawValue: "purchasedPerson"), object: nil)

            //performSegue(withIdentifier: "purchasePerson", sender: nil)
            quote.text = "It looks like you have not unlocked " + array[person] + " :("
            name.text = ""
            unlockPerson.isEnabled = true
            unlockPerson.setTitle("Unlock now!", for: UIControlState.normal)
            unlockPerson.isHidden = false
            quote.textColor = UIColor.white
            unlockPerson.setTitleColor(UIColor.white, for: UIControlState.normal)
            swipeLeft.isEnabled = false
            swipeRight.isEnabled = false
            doubleTap.isEnabled = false
 
        }
        
        
        // Do any additional setup after loading the view.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swipeRight(_ sender: Any) {
        if(it == 0){
            it = (quotes.quotes.count) - 1
        }
        else {
            it = (it-1)
        }
        refresh()
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        it = (it+1)%(quotes.quotes.count)
        refresh()
    }
    
    func refresh(){
        quote.text = quotes.quotes[it]
        name.text = "- " + array[person]
        
        //let rand = Int(arc4random_uniform(UInt32(backgrounds.count)))
        //backgroundView.image = UIImage(named: backgrounds[rand])!
        
        
        if favorites.keys.contains(String(describing: quote.text!)) {
            favButton.tintColor = UIColor.orange
        }
        else {
            favButton.tintColor = UIColor.darkGray
        }
    }
    
    @IBAction func clickedFavButton(_ sender: Any) {
        if(favButton.tintColor == UIColor.darkGray){
            favorites[String(describing: quote.text!)] = String(describing: name.text!.dropFirst(2))
            favButton.tintColor = UIColor.orange
        }
        else {
            favorites.removeValue(forKey: String(describing: quote.text!))
            favButton.tintColor = UIColor.darkGray
        }
    }
    
    @IBAction func clickedShareButton(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.quote.text! + " " + self.name.text!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func unlockNewPerson(_ sender: Any) {
        
        didPurchase = false
        
        purchasesController.buyItem(withProductID: locked[array[person]]!)
        purchasesController.onPurchase = {
            (itemID) in
            dict[array[person]] = true
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "purchasedPerson"), object: nil)
        }
        purchasesController.onRestore = {
            (itemID) in
            dict[array[person]] = true
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "purchasedPerson"), object: nil)
        }
        
        
        //TODO add error catching for when user cancels purchase request
        
        /*print(locked[array[person]]!)
        InAppPurchases.shared.purchase(product: locked[array[person]]!)
        print(array[person])
        dict[array[person]] = true
        print("here")
        let defaults = UserDefaults.standard
        defaults.set(dict, forKey: "unlockedPeople")
        viewDidLoad()
        */
        /*processing = true
        
        while(processing == true){
            sleep(1)
            print(processing)
        }
        if(purchased == true){
        }*/
        
    }
    
    @objc func personPurchased(){
        quotes = PeopleQuotes(i: person)
        refresh()
        unlockPerson.isHidden = true
    }
    

    @IBAction func doubleTapped(_ sender: Any) {
        print("double tapped")
    }
    
    @IBAction func backToMainMenu() {
        navigationController?.popToRootViewController(animated: false)
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
