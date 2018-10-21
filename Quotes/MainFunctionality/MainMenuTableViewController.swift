//
//  MainMenuTableViewController.swift
//  Quotes
//
//  Created by James Motes on 2/26/18.
//  Copyright © 2018 JDM. All rights reserved.
//

//TODO: Adjust to consolidation of moods and quotes
//TODO: Make it pretty

import UIKit

class MainMenuTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var lockImage2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


let mainMenuOptions = [/*"General", */"People", "Categories",/* "Mood",*/ "Favorites", "Custom Notifications", "Fonts and Backgrounds", "Add Your Own Quote", "Unlock Features", /*"Recommended Motivators",*/ "Contact Us", "Review Us"]
let mainMenuWhiteIcons = ["PeopleWhite.png", "CategoriesWhite.png", "star", "AlarmIconWhite.png", "FontsWhite.png", "PersonalWhite.png", "unlockwhite.png", /*"influencer_white.png",*/ "ContactUsWhite.png", "ReviewWhite.png"]

let mainMenuBlackIcons = ["PeopleBlack.png", "CategoriesBlack.png", "star", "AlarmIconBlack.png", "FontsBlack.png", "PersonalBlack.png", "unlockblack.png", /*"influencer_black.png",*/ "ContactUsBlack.png", "ReviewBlack.png"]


let peopleOptions = [/*"Elon Musk",*/ "LeBron James", "Gary Vaynerchuck", "Big Brandon Carter", "DJ Khaled", "Barack Obama", "J.K. Rowling", "Beyonce", "Conor McGregor", "Dr. Seuss", "Thomas Jefferson", "Will Smith", "Grant Cardone", "Michael Jordan", "Muhammad Ali", "Steve Jobs", "Arnold Schwarzenegger", "Oprah Winfrey", "Tom Brady", "Stephen Hawking", "Floyd Mayweather", "Wayne Gretzky", "Emma Watson", "Maya Angelou", "Mark Twain", "Jackie Chan", "Matthew McConaughey", "Morgan Freeman", "Michelle Obama", "Eleanor Roosevelt", "Serena Williams", "Margaret Thatcher", "Richard Branson", "Robert Kiyosaki", "Florence Griffith Joyner", "Idris Elba", "Nelson Mandela", "Walt Disney", "Dale Carnegie", "Robert Downey Jr.", "Lionel Messi", "Mahatma Ghandi", "Drake", "J.Cole", "Harvey Specter", "David Goggins", "Helen Keller", "Tony Robbins", "Bruce Lee", "Dalai Lama", "Bill Gates", "Jilian Michaels", "Barbara Corcoran", "Mark Cuban"]
let catOptions = [/*"General",*/ "Change", /*"Success",*/"Entrepreneur", "Fitness", "Relationships", "Sports", "Motivational", "Empowerment", "Hungry"/*, "Death"*/]
//let moodOptions = ["Happy", "Motivational", "Sad", "Hungry"]

var catIconsWhite = ["ChangeIconWhite.png", "EntrepreneurIconWhite.png", "FitnessIconWhite.png", "RelationshipsIconWhite.png", "SportsIconWhite.png", "MotivationalIconWhite.png", "EmpowermentIconWhite.png", "HungryIconWhite.png"]

var catIconsBlack = ["ChangeIconBlack.png", "EntrepreneurIconBlack.png", "FitnessIconBlack.png", "RelationshipsIconBlack.png", "SportsIconBlack.png", "MotivationalIconBlack.png", "EmpowermentIconBlack.png", "HungryIconBlack.png"]

let MAIN_MENU = 0
let PEOPLE_MENU = 1
let CAT_MENU = 2
let INF_MENU = 3

let WHITE_ICONS = 0
let BLACK_ICONS = 1
//let MOOD_MENU = 3

class MainMenuTableViewController: UITableViewController {

    var tableOptions = [mainMenuOptions, peopleOptions, catOptions/*, moodOptions*/]
    var catColorIcons = [catIconsWhite, catIconsBlack]
    var currentMenu = MAIN_MENU
    let MinHeight: CGFloat = 100.0
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        
        /*if(whiteBackground){ backButton.setBackgroundImage(UIImage(named: "BackButtonBlack.png"), for: UIControlState.normal)
        }
        else {
            backButton.setBackgroundImage(UIImage(named: "BackButtonWhite.png"), for: UIControlState.normal)
        }*/
        
        self.tableView.tableFooterView = UIView()
        super.viewDidLoad()
 
        backButton.imageEdgeInsets.right = view.frame.size.width - 30
        
        for i in 1...(tableOptions.count-1) {
            tableOptions[i] = tableOptions[i].sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        }
        tableOptions[CAT_MENU] = ["General", "Success"] + tableOptions[CAT_MENU]
        tableOptions[PEOPLE_MENU] = ["Elon Musk"] + tableOptions[PEOPLE_MENU]
        
        catColorIcons[BLACK_ICONS] = catIconsBlack.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        catColorIcons[BLACK_ICONS] = ["GeneralIconBlack.png", "SuccessIconBlack.png"] + catIconsBlack
        
        print(catIconsBlack)
        
        catColorIcons[WHITE_ICONS] = catIconsWhite.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        catColorIcons[WHITE_ICONS] = ["GeneralIconWhite.png", "SuccessIconWhite.png"] + catIconsWhite
        
        print(catIconsWhite)
        
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backgroundColor = UIColor.clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = UIColor.clear
        
        //InAppPurchases.shared.getProducts()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func setTheme(){
        tableView.tableHeaderView?.backgroundColor = UIColor.clear
        
        view.backgroundColor = globalTheme.getBackgroundColor()
        if(globalTheme.whiteBackground){
            view.backgroundColor = UIColor.white
        }
        else {
            view.backgroundColor = UIColor.black
        }
        tableView.backgroundColor = globalTheme.getBackgroundColor()
        
        
        if(globalTheme.whiteBackground){
            backButton.setImage(UIImage(named: "BackButtonBlack.png"), for: .normal)
        } else {
            backButton.imageView?.image = UIImage(named: "BackButtonWhite.png")
        }
        
        
        view.backgroundColor = globalTheme.getBackgroundColor()
        tableView.backgroundColor = globalTheme.getBackgroundColor()
        backButton.backgroundColor = globalTheme.getBackgroundColor()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        setTheme()
        navigationController?.isNavigationBarHidden = false
        if(justChanged){
            justChanged = false
            dismiss(animated: true, completion: nil)
        }
        
        
        
        //checkSubscription()
        
        // Reset params
        pers = ""
        category = ""
        //md = ""
        isFavorite = false
        isDownvote = false
        isRandom = false
        
    }
    
    func checkSubscription(){
        guard PurchasesController.shared.currentSessionId != nil,
            PurchasesController.shared.hasReceiptData else {
                full_unlock = false
                return
        }
        full_unlock = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Set front page parameters
        if currentMenu == MAIN_MENU {   // Main menu, NOT submenu (could break things)
            print("Something from the main menu was selected.")
            switch indexPath.item {
            case 0:     // People
                print("A person was selected.")
                /*if(full_unlock){
                    currentMenu = PEOPLE_MENU
                }
                else {
                    performSegue(withIdentifier: "menuToPurchase", sender: nil)
                    return
                }*/
                currentMenu = PEOPLE_MENU
            case 1:     // Categories
                print("A category was selected.")
                currentMenu = CAT_MENU
            /*case 2:     // Mood
                print("A mood was selected.")
                currentMenu = MOOD_MENU*/
            case 2:     // Favorites
                print("The favorites were selected.")
                isFavorite = true   // Show favorited quotes on Front Page
//                performSegue(withIdentifier: "toQuotesPage", sender: nil)
                personalQuotes = false
                dismiss(animated: true, completion: nil)
            case 3:     // Alarms
                print("The settings were selected.")
                performSegue(withIdentifier: "viewSettings", sender: nil)
                //dismiss(animated: true, completion: nil)
            case 4:    // Customization
                print("customization")
                performSegue(withIdentifier: "viewCustomization", sender: nil)
            case 5:    // Personal Quotes
                print("create quote was selected")
                personalQuotes = true
                dismiss(animated: true, completion: nil)
            case 6:    // Unlock
                print("unlock")
                //performSegue(withIdentifier: "viewContactInfo", sender: nil)
                performSegue(withIdentifier: "menuToPurchase", sender: nil)
            /*case 7:    // Influencers
                print("recommended Motivators was selected")
                //performSegue(withIdentifier: "viewRecommendedMotivators", sender: nil)
                currentMenu = INF_MENU
 */
            case 7:    // Contact Us
                print("conact us was selected")
                //performSegue(withIdentifier: "viewContactInfo", sender: nil)
                let email = "contact@gbjmobile.com"
                if let url = URL(string: "mailto:\(email)") {
                    UIApplication.shared.open(url)
                }
            case 8: // Review Us
                print("review us was selected")
                let appID = "1332578279"
                //"itms-apps://itunes.apple.com/us/app/apple-store/1332578279?mt=8"
                if let reviewURL = URL(string:
                    "itms-apps://itunes.apple.com/app/viewContentsUserReviews?id=\(appID)"), UIApplication.shared.canOpenURL(reviewURL) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(reviewURL, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(reviewURL)
                    }
                }

            default:    // Random, or something fails
                isRandom = true
                print("Random quotes were selected, or something failed.")
//                performSegue(withIdentifier: "toQuotesPage", sender: nil)
                personalQuotes = false
                dismiss(animated: true, completion: nil)
            }
        }

        else {  // Inside a submenu, same case values don't apply
            switch currentMenu {
            case PEOPLE_MENU:   // A Person was selected
                
                if(full_unlock){
                    pers = tableOptions[currentMenu][indexPath.item]
                }
                else {
                    if(tableOptions[currentMenu][indexPath.item] == "Elon Musk"){
                        pers = tableOptions[currentMenu][indexPath.item]
                    }
                    else{
                        performSegue(withIdentifier: "menuToPurchase", sender: nil)
                        return
                    }
                }
                
                //print("\(pers) was selected.")
            case CAT_MENU:      // A Category was selected
                
                if(full_unlock){
                    category = tableOptions[currentMenu][indexPath.item]
                }
                else {
                    if(tableOptions[currentMenu][indexPath.item] == "General" || tableOptions[currentMenu][indexPath.item] == "Success"){
                        category = tableOptions[currentMenu][indexPath.item]
                    }
                    else{
                        performSegue(withIdentifier: "menuToPurchase", sender: nil)
                        return
                    }
                }
                
                
                //print("\(category) was selected.")
            /*case MOOD_MENU:     // A Mood was selected
                md = tableOptions[currentMenu][indexPath.item]
                print("\(md) was selected.")*/
            case INF_MENU:
                selectedInfluencer = influencers[indexPath.item]
                performSegue(withIdentifier: "viewRecommendedMotivators", sender: nil)
                return
            default:            // Something broke
                break
            }
            personalQuotes = false
            dismiss(animated: true, completion: nil)
        }
        
        // Reload table with new information
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(currentMenu == INF_MENU) {
            return influencers.count
        }
        else {
            return tableOptions[currentMenu].count
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentMenu == MAIN_MENU {
            tableView.alwaysBounceVertical = false
        }
        // Get the table item
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MainMenuTableViewCell
        
        cell.textLabel?.text = ""
        
        cell.icon.layer.borderColor = UIColor.clear.cgColor
        
        // Design item as necessary
        // sort array alphabetically
        var sortedArray : [String] = []
        let labelFontSize = 21
        if(currentMenu != MAIN_MENU && currentMenu != INF_MENU){
            sortedArray = tableOptions[currentMenu]//.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
            
            if(!full_unlock){
                if(currentMenu == CAT_MENU || currentMenu == PEOPLE_MENU){
                    if(sortedArray[indexPath.row] == "General" || sortedArray[indexPath.row] == "Success" || sortedArray[indexPath.row] == "Elon Musk"){
                        cell.lockImage.isHidden = true
                        cell.lockImage2.isHidden = true
                    }
                    else{
                        if(currentMenu == PEOPLE_MENU){
                            cell.lockImage.isHidden = false
                        }
                        else {
                            cell.lockImage2.isHidden = false
                        }
                    }
                }
                else{
                    cell.lockImage.isHidden = true
                }
            }
            
            cell.label.text = ""
            
            
            cell.label2.text = sortedArray[indexPath.row]
            
            if(currentMenu == CAT_MENU){
                if(globalTheme.whiteBackground){
                    cell.icon.image = UIImage(named: (catColorIcons[BLACK_ICONS])[indexPath.row])
                }
                else {
                    //print(indexPath.row)
                    //print(sortedArray)
                    cell.icon.image = UIImage(named: (catColorIcons[WHITE_ICONS])[indexPath.row])
                }
                
                //cell.label2.text = cell.label2.text! + "    "
                
                cell.label2.isHidden = true
                
                cell.label.text = (tableOptions[currentMenu])[indexPath.row]        // Label text
                //cell.textLabel?.textAlignment = .center                           // Center text
                cell.backgroundColor = globalTheme.getBackgroundColor()
                cell.label.backgroundColor = globalTheme.getBackgroundColor()      // Set background color
                
                //let currentSize = 100
                //cell.label.font = UIFont(name: "System", size: CGFloat(currentSize))
                
                cell.label.font = UIFont(name: globalTheme.font, size: CGFloat(labelFontSize))   // Set font
                cell.label.textColor = globalTheme.getTextColor()                                          // Set font color
                cell.label.adjustsFontSizeToFitWidth = true
                
            }
            else {
                
                cell.icon.image = nil
                cell.label2.textAlignment = .left
                
                cell.label2.font = UIFont(name: globalTheme.font, size: CGFloat(labelFontSize))  // Set font
                cell.label2.adjustsFontSizeToFitWidth = true                                      // Set font size
                cell.label2.backgroundColor = globalTheme.getBackgroundColor()               // Set background color
                cell.label2.textColor = globalTheme.getTextColor()                               // Set font color
            }
            
            
            cell.backgroundColor = globalTheme.getBackgroundColor()

        }
        else if(currentMenu == INF_MENU){
            cell.label.text = influencers[indexPath.row].name

            //cell.label2.text = sortedArray[indexPath.row]
            //cell.icon.image = influencers[indexPath.row].image
            
            cell.icon.image = selectedInfluencer.image
            cell.icon.layer.cornerRadius = cell.icon.frame.size.height / 2;
            cell.icon.clipsToBounds = true;
            cell.icon.layer.borderWidth = 0.5
            cell.icon.layer.borderColor = UIColor.white.cgColor
            cell.icon.image = influencers[indexPath.row].image
            //cell.icon.contentMode = .scaleAspectFill
            //cell.label2.textAlignment = .left
            
            //cell.label2.font = UIFont(name: globalTheme.font, size: CGFloat(labelFontSize))  // Set font
            //cell.label2.textColor = globalTheme.getTextColor()                               // Set font color
            //cell.label2.adjustsFontSizeToFitWidth = true                                      // Set font size
            
            cell.backgroundColor = globalTheme.getBackgroundColor()
            //cell.label2.backgroundColor = globalTheme.getBackgroundColor()               // Set background color
        }
        else {
            // Main menu
            cell.label2.text = ""
            cell.lockImage.isHidden = true
            cell.lockImage2.isHidden = true
            //sortedArray = tableOptions[currentMenu]
            if(indexPath.row == 2){
                cell.icon.image = #imageLiteral(resourceName: "star")
                if(globalTheme.whiteBackground){
                    cell.icon.tintColor = UIColor.black
                }
                else {
                    cell.icon.tintColor = UIColor.white
                }
            }
            else {
                if(globalTheme.whiteBackground){
                    cell.icon.image = UIImage(named: mainMenuBlackIcons[indexPath.row])
                }
                else {
                    cell.icon.image = UIImage(named: mainMenuWhiteIcons[indexPath.row])
                }
            }
            cell.label.text = (tableOptions[currentMenu])[indexPath.row]        // Label text
            //cell.textLabel?.textAlignment = .center                           // Center text
            cell.backgroundColor = globalTheme.getBackgroundColor()
            cell.label.backgroundColor = globalTheme.getBackgroundColor()      // Set background color
            
            //let currentSize = 100
            //cell.label.font = UIFont(name: "System", size: CGFloat(currentSize))
            
            cell.label.font = UIFont(name: globalTheme.font, size: CGFloat(labelFontSize))   // Set font
            cell.label.textColor = globalTheme.getTextColor()                                          // Set font color
            cell.label.adjustsFontSizeToFitWidth = true                                     // Set font size
            
            //let currentSize = 32
            //cell.textLabel?.font = UIFont(name: globalFontStyle, size: CGFloat(currentSize))
        }
        /*
        cell.label.text = sortedArray[indexPath.item]                // Label text
        //cell.textLabel?.textAlignment = .center                           // Center text
        cell.backgroundColor = globalBackgroundColor
        cell.label.backgroundColor = globalBackgroundColor                   // Set background color
        //let currentSize = 32
        //cell.textLabel?.font = UIFont(name: globalFontStyle, size: CGFloat(currentSize))
        cell.label.textColor = globalFontColor                         // Set font color
        cell.label.adjustsFontSizeToFitWidth = true                  // Set font size

        if(indexPath.row == 2){
            cell.icon.tintColor = UIColor.white
        }
        else {
            cell.icon.image = UIImage(named: mainMenuWhiteIcons[indexPath.row])
        }
        */
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableHeight = tableView.bounds.height - 45
        let numberOfRows = mainMenuOptions[currentMenu].count
        if(currentMenu == MAIN_MENU || currentMenu == CAT_MENU){
            let numRows = CGFloat(tableOptions[currentMenu].count)
            return tableHeight/numRows
        }
        else if(currentMenu == PEOPLE_MENU) {
            let numRows = CGFloat(tableOptions[CAT_MENU].count)
            return tableHeight/numRows
        }
        else {
            return 65
        }
    }
    
    @IBAction func backToView(_ sender: Any) {
        // Reset quotes page params
        if currentMenu != MAIN_MENU {
            currentMenu = MAIN_MENU
            self.tableView.reloadData()
        }
        else {
            dismiss(animated: true, completion: nil)
        }
    }
}
