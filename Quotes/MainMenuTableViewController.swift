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



let mainMenuOptions = ["General", "People", "Categories",/* "Mood",*/ "Favorites", "Alarms", "Customization", "Personal Quotes", "Contact Us"]
let peopleOptions = ["Elon Musk", "LeBron James", "Gary Vaynerchuck", "Big Brandon Carter", "DJ Khaled", "Barack Obama", "J.K. Rowling", "Beyonce", "Conor McGregor", "Dr. Seuss", "Thomas Jefferson", "Will Smith", "Grant Cardone", "Michael Jordan", "Muhammad Ali", "Steve Jobs", "Arnold Schwarzenegger", "Oprah Winfrey", "Tom Brady", "Stephen Hawking", "Floyd Mayweather", "Wayne Gretzky", "Emma Watson", "Maya Angelou", "Mark Twain", "Jackie Chan", "Matthew McConaughey", "Morgan Freeman", "Michelle Obama", "Eleanor Roosevelt"]
let catOptions = ["Change", "Success","Entrepreneur", "Fitness", "Relationships", "Sports", "Motivational", "Empowerment", "Hungry"/*, "Death"*/]
//let moodOptions = ["Happy", "Motivational", "Sad", "Hungry"]

let MAIN_MENU = 0
let PEOPLE_MENU = 1
let CAT_MENU = 2
//let MOOD_MENU = 3

class MainMenuTableViewController: UITableViewController {

    var tableOptions = [mainMenuOptions, peopleOptions, catOptions/*, moodOptions*/]
    var currentMenu = MAIN_MENU
    let MinHeight: CGFloat = 100.0
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        for i in 1...(tableOptions.count-1) {
            tableOptions[i] = tableOptions[i].sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        }
        
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backgroundColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = UIColor.clear
        
        InAppPurchases.shared.getProducts()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        if(justChanged){
            justChanged = false
            dismiss(animated: true, completion: nil)
        }
        
        // Reset params
        pers = ""
        category = ""
        //md = ""
        isFavorite = false
        isDownvote = false
        isRandom = false
        
        view.backgroundColor = globalBackgroundColor
        tableView.backgroundColor = globalBackgroundColor
        backButton.backgroundColor = globalBackgroundColor
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
            case 1:     // People
                print("A person was selected.")
                currentMenu = PEOPLE_MENU
            case 2:     // Categories
                print("A category was selected.")
                currentMenu = CAT_MENU
            /*case 2:     // Mood
                print("A mood was selected.")
                currentMenu = MOOD_MENU*/
            case 3:     // Favorites
                print("The favorites were selected.")
                isFavorite = true   // Show favorited quotes on Front Page
//                performSegue(withIdentifier: "toQuotesPage", sender: nil)
                personalQuotes = false
                dismiss(animated: true, completion: nil)
            case 4:     // Alarms
                print("The settings were selected.")
                performSegue(withIdentifier: "viewSettings", sender: nil)
                //dismiss(animated: true, completion: nil)
            case 5:    // Customization
                print("customization")
                performSegue(withIdentifier: "viewCustomization", sender: nil)
            case 6:    // Personal Quotes
                print("create quote was selected")
                personalQuotes = true
                dismiss(animated: true, completion: nil)
            case 7:    // Contact Us
                print("conact us was selected")
                performSegue(withIdentifier: "viewContactInfo", sender: nil)
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
                pers = tableOptions[currentMenu][indexPath.item]
                print("\(pers) was selected.")
            case CAT_MENU:      // A Category was selected
                category = tableOptions[currentMenu][indexPath.item]
                print("\(category) was selected.")
            /*case MOOD_MENU:     // A Mood was selected
                md = tableOptions[currentMenu][indexPath.item]
                print("\(md) was selected.")*/
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
        return tableOptions[currentMenu].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentMenu == MAIN_MENU {
            tableView.alwaysBounceVertical = false
        }
        // Get the table item
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuRow", for: indexPath)
        
        // Design item as necessary
        // sort array alphabetically
        var sortedArray : [String] = []
        if(currentMenu != MAIN_MENU){
            sortedArray = tableOptions[currentMenu].sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        }
        else {
            sortedArray = tableOptions[currentMenu]
        }
        cell.textLabel?.text = sortedArray[indexPath.item]                // Label text
        cell.textLabel?.textAlignment = .center                           // Center text
        cell.backgroundColor = globalBackgroundColor
        cell.textLabel?.backgroundColor = globalBackgroundColor                   // Set background color
        //let currentSize = 32
        //cell.textLabel?.font = UIFont(name: globalFontStyle, size: CGFloat(currentSize))
        cell.textLabel?.textColor = globalFontColor                         // Set font color
        cell.textLabel?.adjustsFontSizeToFitWidth = true                  // Set font size

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableHeight = tableView.bounds.height - backButton.frame.size.height*2.7
        print("+++++++++++\(backButton.frame.minY)++++++++++++")
        if currentMenu == MAIN_MENU {
            
        }
        let div = tableHeight/CGFloat(tableOptions[currentMenu].count) //- 10

        return div > MinHeight ? div : MinHeight
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
    
    @IBAction func swipedOnCell(_ sender: Any) {
        
    }
}
