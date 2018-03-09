//
//  SettingsPage.swift
//  Quotes
//
//  Created by James Motes on 3/8/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import UserNotifications

let center = UNUserNotificationCenter.current()
let options: UNAuthorizationOptions = [.alert, .sound];

class SettingsPage: UIViewController , UNUserNotificationCenterDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var data : [String] = [String]()
    var filteredData : [String] = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell.textLabel?.text = filteredData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var person = filteredData[indexPath.item]
        searchController.searchBar.text = person
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.append(contentsOf: peopleOptions)
        data.shuffle()
        filteredData = data
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        center.requestAuthorization(options: options) {
            (granted, error) in
            if !granted {
                print("Something went wrong")
            }
        }
        //createNotification()
        
        
        tableView.sectionIndexTrackingBackgroundColor = UIColor.black
        tableView.sectionIndexBackgroundColor = UIColor.black
        let backView = UIView(frame: self.tableView.bounds)
        backView.backgroundColor = UIColor.black // or whatever color
        self.tableView.backgroundView = backView
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func createNotification(){
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                print("Notifications not currently enabled")
                return
            }
        }
        let content = UNMutableNotificationContent()
        content.title = "Don't forget"
        content.body = "Buy some milk"
        content.sound = UNNotificationSound.default()
        
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
        let date = Date(timeIntervalSinceNow: 3600)
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                // Something went wrong
                print("something went wrong when adding the notification to the request center")
            }
        })
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredData = data.filter { query in
                return query.lowercased().contains(searchText.lowercased())
            }
            
        } else {
            filteredData = data
        }
        tableView.reloadData()
    }
    @IBAction func createAlarm(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
