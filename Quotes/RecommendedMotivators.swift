//
//  RecommendedMotivators.swift
//  Quotes
//
//  Created by James Motes on 6/6/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

var selectedInfluencer : Influencer = Influencer()

let INSTA = 0
let TWITTER = 1
let YOUTUBE = 2
let WEBSITE = 3

class RecommendedMotivators: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton!
    
    var links : [Int] = []
    let linkImages = ["insta.png", "twitter.png", "youtube.png", "safari.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        if selectedInfluencer.insta != "" {
            links.append(INSTA)
        }
        if selectedInfluencer.twitter != "" {
            links.append(TWITTER)
        }
        if selectedInfluencer.youtube != "" {
            links.append(YOUTUBE)
        }
        if selectedInfluencer.website != "" {
            links.append(WEBSITE)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        
        //collectionViewFlowLayout.minimumLineSpacing = 0
        // Do any additional setup after loading the view.
        print(links)
    }

    func setTheme(){
        
        view.backgroundColor = globalTheme.getBackgroundColor()
        
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.backgroundView = UIView()
        
        name.textColor = globalTheme.getTextColor()
        
        if(globalTheme.whiteBackground){
            backButton.setImage(UIImage(named: "BackButtonBlack.png"), for: .normal)
            
        } else {
            backButton.setImage(UIImage(named: "BackButtonWhite.png"), for: .normal)
        }
        
        image.image = selectedInfluencer.image
        image.layer.cornerRadius = image.frame.size.width / 2;
        image.clipsToBounds = true;
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        
        name.text = selectedInfluencer.name
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        let scaleFactor = (screenWidth / 4) - 8
        
        return CGSize(width: scaleFactor, height: scaleFactor)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return links.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "influencerCell", for: indexPath) as! InfluencerLinkCell
        
        /*
         //make fonts same sizes for all the buttons
         twoWeekButton.titleLabel?.adjustsFontSizeToFitWidth = true
         monthlyButton.titleLabel?.adjustsFontSizeToFitWidth = true
         let desc = UIFontDescriptor.init()
         fullButton.titleLabel?.font = UIFont(descriptor: desc, size: (monthlyButton.titleLabel?.font.pointSize)!)
         */
        
        /*switch(indexPath.row){
        case 0:
        
        default:
        }*/
        
        cell.imageView.image = UIImage(named: linkImages[links[indexPath.row]])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch(links[indexPath.row]){
        case 0:
            print("link insta")
            var instagramHooks = "instagram://user?username=\(selectedInfluencer.insta)"
            var instagramUrl = NSURL(string: instagramHooks)
            let application = UIApplication.shared
            if application.canOpenURL(instagramUrl! as URL) {
                application.openURL(instagramUrl! as URL)
            } else {
                //redirect to safari because the user doesn't have Instagram
                application.openURL(NSURL(string: "http://instagram.com/")! as URL)
            }
        case 1:
            print("link twitter")
            let Username =  selectedInfluencer.twitter
            let appURL = NSURL(string: "twitter:///user?screen_name=\(Username)")!
            let webURL = NSURL(string: "https://twitter.com/\(Username)")!
            let application = UIApplication.shared
            if application.canOpenURL(appURL as URL) {
                application.open(appURL as URL)
            } else {
                // if Instagram app is not installed, open URL inside Safari
                application.open(webURL as URL)
            }
        case 2:
            print("link youtube")
            let YoutubeUser =  selectedInfluencer.youtube
            let appURL = NSURL(string: "youtube://www.youtube.com/channel/\(YoutubeUser)")!
            let webURL = NSURL(string: "https://www.youtube.com/channel/\(YoutubeUser)")!
            let application = UIApplication.shared
            
            if application.canOpenURL(appURL as URL) {
                application.open(appURL as URL)
            } else {
                // if Youtube app is not installed, open URL inside Safari
                application.open(webURL as URL)
            }
        case 3:
            print("link website")
            let webURL = NSURL(string: selectedInfluencer.website)!
            let application = UIApplication.shared
            application.open(webURL as URL)
        default:
            return
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
