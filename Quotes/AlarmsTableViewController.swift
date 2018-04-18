//
//  TableViewController.swift
//  Quotes
//
//  Created by James Motes on 3/8/18.
//  Copyright © 2018 JDM. All rights reserved.
//



//TODO: Have way to turn alarms on and off - maybe just need to delete when turned off and recreate when turned back on
//TODO: Need to be able to delete an alarm - figuere out how to have a swipe gesture only on a single cell, figure out how to delete a local alarm
//TODO: Make it look pretty
//TODO: Decide if this feature is going to be an in app purchase or if having above a certain number is or whatever

import UIKit
import UserNotifications

var alarmSelected : String = String()

class AlarmsTableViewController: UITableViewController {
    
    var alarms : [UNNotificationRequest] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        center.getPendingNotificationRequests { (notifications) in
            self.alarms = notifications
            print(notifications)
        }
        
        
        for a in alarms {
            //print(a)
            let index = a.content.body.index(a.content.body.startIndex, offsetBy: a.content.body.count - 8)
            let name = a.content.body[index...]
            print("Name being found by the substring formula thing.....")
            print(name)
            print(AlarmSetPeople)
            let t : UNCalendarNotificationTrigger  = a.trigger as! UNCalendarNotificationTrigger
            if !AlarmSetPeople.contains(String(name)) {
                print("In here")
                AlarmSetPeople.append(String(name))
                
                AlarmSetTime.append(t.dateComponents)
            }
            else if !AlarmSetTime.contains(t.dateComponents) {
                AlarmSetPeople.append(String(name))
                AlarmSetTime.append(t.dateComponents)
            }
        }
        tableView.reloadData()
        
        if(alarms.count > 0){
            print("Alarm > 0")
            let t : UNCalendarNotificationTrigger  = alarms[0].trigger as! UNCalendarNotificationTrigger
            print(t.dateComponents.hour!)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        var recognizer = UISwipeGestureRecognizer(target: self, action: "didSwipe")
        self.tableView.addGestureRecognizer(recognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //alarms = []
        center.getPendingNotificationRequests { (notifications) in
            self.alarms = notifications
            print(notifications)
        }
        
        print(AlarmSetPeople)
        print(alarms)
        for a in alarms {
            print(a)
            var index = a.content.body.index(a.content.body.startIndex, offsetBy: 3)
            let name = a.content.body[index...]
            print("Name being found by the substring formula thing.....")
            print(name)
            let t : UNCalendarNotificationTrigger  = a.trigger as! UNCalendarNotificationTrigger
            
            print(AlarmSetPeople)
            if !AlarmSetPeople.contains(String(name)) {
                AlarmSetPeople.append(String(name))
                AlarmSetTime.append(t.dateComponents)
            }
            else {
                var Repeat = false
                for i in 0...AlarmSetPeople.count-1 {
                    if AlarmSetPeople[i] == name {
                        if AlarmSetTime[i].hour == t.dateComponents.hour && AlarmSetTime[i].minute == t.dateComponents.minute {
                            Repeat = true
                        }
                    }
                }
                if(!Repeat){
                    AlarmSetPeople.append(String(name))
                    AlarmSetTime.append(t.dateComponents)
                }
            }
            
        }
        tableView.reloadData()
        
        if(alarms.count > 0){
            let t : UNCalendarNotificationTrigger  = alarms[0].trigger as! UNCalendarNotificationTrigger
            print(t.dateComponents.hour!)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmSetTime.count
    }

    @IBAction func backToMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        alarmSelected = AlarmSetPeople[indexPath.row]
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.textColor = UIColor.white
        
        //print(alarms[indexPath].trigger)
        // Configure the cell...
        
        
        //var t : UNCalendarNotificationTrigger  = alarms[indexPath.item].trigger as! UNCalendarNotificationTrigger
        //print(t.dateComponents.hour)
        //var hour = t.dateComponents.hour!
        
        var hour = AlarmSetTime[indexPath.row].hour!
        if hour == 0 {
            hour = 12
        }
        else if hour > 12 {
            hour -= 12
        }
        //var minute = t.dateComponents.minute!
        let minute = AlarmSetTime[indexPath.row].minute!
        var minuteString : String = ""
        if(minute < 10) {
            minuteString = "0\(minute)"
        }
        else {
            minuteString = "\(minute)"
        }
        
        //let p : UNNotificationContent = alarms[indexPath.item].content
        let p = AlarmSetPeople[indexPath.row]
        
        cell.textLabel?.text = "\(hour):"+minuteString + "   \(p)"
        return cell
    }
    
    
    /*override func viewDidDisappear(_ animated: Bool) {
        for r in alarms {
            center.add(r, withCompletionHandler: { (error) in
                if let error = error {
                    // Something went wrong
                    print("something went wrong when adding the notification to the request center")
                }
            })
        }
    }*/
    

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

}
