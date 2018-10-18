//
//  SettingsPage.swift
//  Quotes
//
//  Created by James Motes on 3/8/18.
//  Copyright © 2018 JDM. All rights reserved.
//

//person for alarm and time it takes place at
var AlarmSetPeople : [String] = []
var AlarmSetTime   : [DateComponents] = []

//TODO: sort alarms when they're inserted so that they appear in order when listed


import UIKit
import UserNotifications
import Realm
import RealmSwift

let center = UNUserNotificationCenter.current()
let options: UNAuthorizationOptions = [.alert, .sound];

class SettingsPage: UIViewController , UNUserNotificationCenterDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    let realm = try! Realm()
    
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
        cell.textLabel?.textColor = globalTheme.getTextColor()
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = filteredData[indexPath.item]
        searchController.searchBar.text = person
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        
        data.append(contentsOf: peopleOptions)
        data.append("Elon Musk")
        data.append(contentsOf: catOptions)
        data.shuffle()
        filteredData = data
        center.requestAuthorization(options: options) {
            (granted, error) in
            if !granted {
                print("Something went wrong")
            }
        }
        
        datePicker.datePickerMode = UIDatePickerMode.time
        
        //createNotification()
        
        
        let backView = UIView(frame: self.tableView.bounds)
        backView.backgroundColor = globalTheme.getBackgroundColor()// or whatever color
        self.tableView.backgroundView = backView
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    func setTheme(){
        view.backgroundColor = globalTheme.getBackgroundColor()
        datePicker.backgroundColor = globalTheme.getBackgroundColor()
        
        if(globalTheme.whiteBackground){
            backButton.setImage(UIImage(named: "BackButtonBlack.png"), for: .normal)
        } else {
            backButton.imageView?.image = UIImage(named: "BackButtonWhite.png")
        }
        saveButton.setTitleColor(globalTheme.getTextColor(), for: .normal)
        
        datePicker.setValue(globalTheme.getTextColor(), forKeyPath: "textColor")
        tableView.sectionIndexTrackingBackgroundColor = globalTheme.getBackgroundColor()
        tableView.sectionIndexBackgroundColor = globalTheme.getBackgroundColor()
        
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
        filteredData = filteredData.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        tableView.reloadData()
    }
    @IBAction func createAlarm(_ sender: Any) {
        
        print(numAlarms)
        print(full_unlock)
        
        if(numAlarms > 0 && !full_unlock && !DEVELOPMENT){
            performSegue(withIdentifier: "unlockAlarmsSegue", sender: nil)
        }
        else {
            let date = datePicker.date
            print("Date entry")
            print(date)
            
            var triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
            
            let query = "person = '" + filteredData[0] + "'"
            var quotes = Array(realm.objects(Quote.self).filter(query))
            if(quotes.count < 1){
                var checkQuotes = Array(realm.objects(Quote.self))//.filter(category + " IN %@", ))
                if(filteredData[0] != "General"){
                    var remove : [Int] = [Int]()
                    quotes = []
                    for i in 0...(checkQuotes.count - 1) {
                        let string = checkQuotes[i].categories
                        if (checkQuotes[i].categories.contains(filteredData[0])){
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
            }
            //print(quotes)
            quotes.shuffle()
            
            AlarmSetPeople.append(filteredData[0])
            AlarmSetTime.append(triggerDate)
            
            
            /*let defaults = UserDefaults.standard
             defaults.set(AlarmSetPeople, forKey: "AlarmSetPeople")
             defaults.set(AlarmSetTime, forKey: "AlarmSetTime")
             */
            triggerDate.day = triggerDate.day! - 1
            triggerDate.second = 0
            var index = 0
            
            while(index < 31){
                for q in quotes {
                    var currentCount = 0
                    for i in AlarmSetPeople {
                        if i == q.person {
                            currentCount = currentCount + 1
                        }
                    }
                    
                    let content = UNMutableNotificationContent()
                    //content.title =
                    content.body = q.text + " - " + q.person
                    content.sound = UNNotificationSound.default()
                    content.categoryIdentifier = "RECEIVED_QUOTE"
                    
                    //should probably adjust for months with 30 and 28 days
                    triggerDate.day = triggerDate.day! + 1
                    if(triggerDate.day! > 31){
                        triggerDate.day = 1
                        triggerDate.month = triggerDate.month! + 1
                        if(triggerDate.month! > 12){
                            triggerDate.month = 1
                        }
                    }
                    
                    //print("TriggerDate")
                    //print(triggerDate)
                    
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                    
                    let identifier = q.person + (String)(index + currentCount * 31)
                    let request = UNNotificationRequest(identifier: identifier,
                                                        content: content, trigger: trigger)
                    center.add(request, withCompletionHandler: { (error) in
                        if let error = error {
                            // Something went wrong
                            print("something went wrong when adding the notification to the request center")
                        }
                    })
                    index += 1
                    if(index > 31){
                        break
                    }
                }
            }
            dismiss(animated: true, completion: nil)
        }
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
