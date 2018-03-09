//
//  AppDelegate.swift
//  Quotes
//
//  Created by James Motes on 12/26/17.
//  Copyright © 2017 JDM. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import FirebaseMessaging
import FirebaseInstanceID
import FirebaseDatabase
import RealmSwift
import GoogleMobileAds



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isInitialized = false
    
    let realm = try! Realm()
    
    var notify = false
    
    override init() {
        
        FirebaseApp.configure()
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey: "updated") == false){
            updateDatabase()
            defaults.set(true, forKey: "updated")
        }
        var quote = realm.objects(Quote.self).filter("person = 'Elon Musk'")
        print(quote)
        
        
        
        /*if (defaults.dictionary(forKey: "favorites") != nil){
            favorites = defaults.dictionary(forKey: "favorites") as! [String : String]
        }
        else {
            defaults.set(favorites, forKey: "favorites")
        }
        
        if (defaults.dictionary(forKey: "unlockedPeople") != nil){
            dict = defaults.dictionary(forKey: "unlockedPeople") as! [String : Bool]
        }
        else {
            defaults.set(dict, forKey: "unlockedPeople")
        }*/
        
        //setupNotifications
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            if (error == nil){
                print("Successful authoriation")
            }
        }
        application.registerForRemoteNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshToken(notification:)), name: NSNotification.Name.InstanceIDTokenRefresh, object: nil)
        
        //set up ads
        GADMobileAds.configure(withApplicationID: "ca-app-pub-1816441460162466~7930915740")
        
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.set(dict, forKey: "unlockedPeople")
        Messaging.messaging().shouldEstablishDirectChannel = false
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        FBHandler()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
    }
/*
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
            self.notify = granted
            print(self.notify)
            guard granted else { return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
  */
    
    @objc func refreshToken(notification: NSNotification){
        let refreshToken = InstanceID.instanceID().token()!
        print("*** \(refreshToken) ***")
        
        FBHandler()
    }
    
    func FBHandler() {
        Messaging.messaging().shouldEstablishDirectChannel = true
    }
    
    func updateDatabase(){
        
        var lq : LoadQuotes = LoadQuotes()
        
        /*var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            guard let value = snapshot.value as? Dictionary<String,Dictionary<String,Dictionary<String,Any>>> else {return}
            
            print(value)
            
            for (person, q) in value {
                //print(person)
                for(label, info) in q {
                    //print(label)
                    var quote = Quote()
                    quote.person = person
                    for(thing, data) in info {
                        //print(thing)
                        if(thing == "categories"){
                            for(cat, b) in data as! Dictionary<String,Any>{
                                quote.categories.insert(cat, at: quote.categories.count)
                            }
                        }
                        else if(thing == "moods"){
                            for(mood, b) in data as! Dictionary<String,Any>{
                                quote.moods.insert(mood, at: quote.moods.count)
                            }
                        }
                        else if(thing == "text"){
                            quote.text = data as! String
                        }
                    }
                    try! self.realm.write {
                        self.realm.add(quote)
                    }
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }*/
    }
   

}

extension UIView {
    
    /**
     Adds a vertical gradient layer with two **UIColors** to the **UIView**.
     - Parameter topColor: The top **UIColor**.
     - Parameter bottomColor: The bottom **UIColor**.
     */
    
    func addVerticalGradientLayer(topColor:UIColor, bottomColor:UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            topColor.cgColor,
            bottomColor.cgColor
        ]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
}

