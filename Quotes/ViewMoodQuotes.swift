//
//  ViewMoodQuotes.swift
//  Quotes
//
//  Created by James Motes on 1/25/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class ViewMoodQuotes: UIViewController {

    var quotes = MoodQuotes(i: -1)
    var it = 0
    
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var name: UILabel!
    
    //@IBOutlet weak var backgroundView: UIImageView!
    
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.clear
        quotes = MoodQuotes(i: mood)
        quote.adjustsFontSizeToFitWidth = true
        refresh()
        
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
        quote.text = [String](quotes.quotes.values)[it]
        name.text = "- " + [String](quotes.quotes.keys)[it]
        
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
    
    @IBAction func backToMainMenu() {
        navigationController?.popToRootViewController(animated: false)
    }
}
