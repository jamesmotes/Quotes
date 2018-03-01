//
//  MainMenuTableViewController.swift
//  Quotes
//
//  Created by James Motes on 2/26/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

let mainMenuOptions = ["People", "Categories", "Mood", "Favorites", "Random", "Settings"]
let peopleOptions = ["Blake Nelson"]
let catOptions = ["Change", "Success","Entrepreneur", "Fitness", "Relationships", "Sports", /*"Death"*/]
let moodOptions = ["Happy", "Motivational", "Sad", "Hungry"]

let MAIN_MENU = 0
let PEOPLE_MENU = 1
let CAT_MENU = 2
let MOOD_MENU = 3

class MainMenuTableViewController: UITableViewController {
    
    let tableOptions = [mainMenuOptions, peopleOptions, catOptions, moodOptions]
    var currentMenu = MAIN_MENU
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backgroundColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = UIColor.clear
        
        dict["Gabriel Wang"] = false
        dict["Conor McGregor"] = true
        InAppPurchases.shared.getProducts()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
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
        // Set front page parameters inside cases
        switch indexPath.item {
        case 0:     // People
            performSegue(withIdentifier: "toQuotesPage", sender: nil)
        case 1:     // Categories
            performSegue(withIdentifier: "toQuotesPage", sender: nil)
        case 2:     // Mood
            performSegue(withIdentifier: "toQuotesPage", sender: nil)
        case 3:     // Favorites
            performSegue(withIdentifier: "toQuotesPage", sender: nil)
        default:    // Settings, Random, something fails
            performSegue(withIdentifier: "toQuotesPage", sender: nil)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableOptions[currentMenu].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the table item
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuRow", for: indexPath)
        
        // Design item as necessary
        cell.textLabel?.text = tableOptions[currentMenu][indexPath.item]  // Label text

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backToView(_ sender: Any) {
        // Reset quotes page params
        
        dismiss(animated: true, completion: nil)
    }
    
}
