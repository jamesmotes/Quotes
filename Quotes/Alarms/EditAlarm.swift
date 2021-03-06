//
//  EditAlarm.swift
//  Quotes
//
//  Created by James Motes on 4/15/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit
import UserNotifications
import Realm
import RealmSwift

var didDelete = false
var preDeleteCount = 0

class EditAlarm: UIViewController {

    let realm = try! Realm()
    
    var alarms : [UNNotificationRequest] = []
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didDelete = false
        setTheme()
        center.getPendingNotificationRequests { (notifications) in
            self.alarms = notifications
            //print(notifications)
        }
        // Do any additional setup after loading the view.
    }
    
    func setTheme(){
        datePicker.setValue(globalTheme.getTextColor(), forKeyPath: "textColor")
        
        view.backgroundColor = globalTheme.getBackgroundColor()
        datePicker.backgroundColor = globalTheme.getBackgroundColor()
        
        if(globalTheme.whiteBackground){
            backButton.setImage(UIImage(named: "BackButtonBlack.png"), for: .normal)
            saveButton.setTitleColor(UIColor.black, for: .normal)
        } else {
            backButton.imageView?.image = UIImage(named: "BackButtonWhite.png")
            saveButton.setTitleColor(UIColor.white, for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToAlarmMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func removeAlarm(name: String){
        var person : String = String()
        var time : DateComponents = DateComponents()
        for i in 0...(AlarmSetPeople.count) {
            if AlarmSetPeople[i] == name {
                AlarmSetPeople.remove(at: i)
                AlarmSetTime.remove(at: i)
                break
            }
        }
        
        var toRemove : [String] = []
        
        for a in alarms {
            if (a.content.body).range(of:alarmSelected) != nil {
                toRemove.append(a.identifier)
            }
        }
        
        print("Printing all notifications in notification center")
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: toRemove)
        center.getPendingNotificationRequests { (notifications) in
            self.alarms = notifications
            print(notifications)
        }
        print("Done\n\n")
        
    }
    
    
    @IBAction func editAlarm(_ sender: Any) {
        removeAlarm(name: alarmSelected)
        didEdit = true
        /*
        var date = datePicker.date
        print("Date entry")
        print(date)
        
        var triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        
        let query = "person = '" + alarmSelected + "'"
        var quotes = Array(realm.objects(Quote.self).filter(query))
        //print(quotes)
        quotes.shuffle()
        
        AlarmSetPeople.append(alarmSelected)
        AlarmSetTime.append(triggerDate)
        
        
        /*let defaults = UserDefaults.standard
         defaults.set(AlarmSetPeople, forKey: "AlarmSetPeople")
         defaults.set(AlarmSetTime, forKey: "AlarmSetTime")
         */
        triggerDate.day = triggerDate.day! - 1
        
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
                
                //should probably adjust for months with 30 and 28 days
                triggerDate.day = triggerDate.day! + 1
                
                triggerDate.second = 0
                
                if(triggerDate.day! > 31){
                    triggerDate.day = 1
                    triggerDate.month = triggerDate.month! + 1
                    if(triggerDate.month! > 12){
                        triggerDate.month = 1
                    }
                }
                
                //print("TriggerDate")
                //print(triggerDate)
                
                var adjustedTriggerDate = triggerDate
                
                if(index > 28){
                    if(triggerDate.month == 2){
                        adjustedTriggerDate.month = adjustedTriggerDate.month! + 1
                    }
                    else if(index > 30){
                        if(triggerDate.month == 4 || triggerDate.month == 6 || triggerDate.month == 9 || triggerDate.month == 11 ){
                            adjustedTriggerDate.month = adjustedTriggerDate.month! + 1
                        }
                    }
                }
                let trigger = UNCalendarNotificationTrigger(dateMatching: adjustedTriggerDate, repeats: false)
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
        }*/
        
        let date = datePicker.date
        print("Date entry")
        print(date)
        
        var triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let query = "person = '" + alarmSelected + "'"
        var quotes = Array(realm.objects(Quote.self).filter(query))
        //print(quotes)
        quotes.shuffle()
        
        print(AlarmSetPeople)
        print(AlarmSetTime)
        
        AlarmSetPeople.append(alarmSelected)
        AlarmSetTime.append(triggerDate)
        
        
        /*let defaults = UserDefaults.standard
         defaults.set(AlarmSetPeople, forKey: "AlarmSetPeople")
         defaults.set(AlarmSetTime, forKey: "AlarmSetTime")
         */
        triggerDate.second = 0
        
        if(triggerDate.hour == timeSelected.hour && triggerDate.minute == timeSelected.minute){
            didEdit = false
        }
        
        triggerDate.day = triggerDate.day! - 1
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
    
    @IBAction func deleteAlarm(_ sender: Any) {
        removeAlarm(name: alarmSelected)
        didDelete = true
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
