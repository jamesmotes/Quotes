//
//  Settings.swift
//
//
//  Created by James Motes on 1/5/18.
//

import UIKit

class Settings: UIViewController {
    
    @IBOutlet var notificationsSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = UserDefaults.standard
        if (defaults.object(forKey: "NotificationState") != nil) {
            notificationsSwitch.isOn = defaults.bool(forKey: "NotificationState")
        }
 
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveNotificationState(_ sender: Any) {
        var defaults = UserDefaults.standard
        if notificationsSwitch.isOn {
            defaults.set(true, forKey: "NotificationState")
        }
        else  {
            defaults.set(false, forKey: "NotificationState")
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

