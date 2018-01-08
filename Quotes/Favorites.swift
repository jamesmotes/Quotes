//
//  Favorites.swift
//  
//
//  Created by James Motes on 1/6/18.
//

import UIKit

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

class Favorites: UIViewController {
    
    
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    var quotes : [String] = [String](favorites.keys).shuffled()
    var it = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favButton.tintColor = UIColor.red
        refresh()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refresh(){
        if(quotes.count > 0){
            quote.text = quotes[it]
            name.text = "- " + favorites[quotes[it]]!
        }
        else {
            quote.text = "You don't have any favorites :("
            name.text = "- James Motes"
        }
    }
    
    @IBAction func clickedFavButton(_ sender: Any) {
        if(quotes.count < 0){
            favorites.removeValue(forKey: String(describing: quote.text!))
            quotes.remove(at: it)
        }
        refresh()
    }
    
    @IBAction func swipedRight(_ sender: Any) {
        if(it == 0){
            it = (quotes.count) - 1
        }
        else {
            it = (it-1)
        }
        refresh()
    }
    
    
    @IBAction func swipedLeft(_ sender: Any) {
        it = (it+1)%(quotes.count)
        refresh()
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
