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

let mainMenuOptions = ["People", "Categories",/* "Mood",*/ "Favorites", "General", "Alarms"]
let peopleOptions = ["Elon Musk", "Lebron James", "Gary Vaynerchuck", "Big Brandon Carter", "DJ Khaled", "Barack Obama", "J.K. Rowling", "Beyonce", "Connor McGregor", "Thomas Jefferson", "Will Smith", "Grant Cardone", "Michael Jordan", "Muhammad Ali", "Steve Jobs", "Arnold Schwarzenegger", "Oprah Winfrey", "Tom Brady"]
let catOptions = ["Change", "Success","Entrepreneur", "Fitness", "Relationships", "Sports", "Happy", "Motivational", "Sad", "Hungry"/*, "Death"*/]
//let moodOptions = ["Happy", "Motivational", "Sad", "Hungry"]

let MAIN_MENU = 0
let PEOPLE_MENU = 1
let CAT_MENU = 2
//let MOOD_MENU = 3

class MainMenuTableViewController: UITableViewController {
    
    let tableOptions = [mainMenuOptions, peopleOptions, catOptions/*, moodOptions*/]
    var currentMenu = MAIN_MENU
    let MinHeight: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Reset params
        pers = ""
        category = ""
        //md = ""
        isFavorite = false
        isDownvote = false
        isRandom = false
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
                dismiss(animated: true, completion: nil)
            case 4:     // Alarms
                print("The settings were selected.")
                performSegue(withIdentifier: "viewSettings", sender: nil)
                //dismiss(animated: true, completion: nil)
            default:    // Random, or something fails
                isRandom = true
                print("Random quotes were selected, or something failed.")
//                performSegue(withIdentifier: "toQuotesPage", sender: nil)
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
        cell.textLabel?.text = tableOptions[currentMenu][indexPath.item]  // Label text
        cell.textLabel?.textAlignment = .center                           // Center text
        cell.textLabel?.adjustsFontSizeToFitWidth = true                  // Set font size
        cell.textLabel?.backgroundColor = UIColor.black                   // Set background color
        cell.textLabel?.textColor = UIColor.white                         // Set font color

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableHeight = tableView.bounds.height - 60
        if currentMenu == MAIN_MENU {
            
        }
        let div = tableHeight/CGFloat(tableOptions[currentMenu].count)

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
