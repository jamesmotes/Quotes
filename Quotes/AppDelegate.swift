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
import StoreKit

var notificationQuote : String = ""



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

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
        if(defaults.bool(forKey: "HasBeenLaunched") == false){
            defaults.set([], forKey: "AlarmSetPeople")
            defaults.set([], forKey: "AlarmSetTime")
            defaults.set(true, forKey: "HasBeenLaunched")
            defaults.set(10, forKey: "reviewCountdown")
        }
        else{
            AlarmSetPeople = defaults.array(forKey: "AlarmSetPeople") as! [String]
            AlarmSetTime = defaults.array(forKey: "AlarmSetTime") as! [DateComponents]
        }
        
        if(defaults.integer(forKey: "reviewCountdown") == 0){
            if #available( iOS 10.3,*){
                SKStoreReviewController.requestReview()
            }
        } else {
            let countdown = defaults.integer(forKey: "reviewCountdown") - 1
            defaults.set(countdown, forKey: "reviewCountdown")
        }
        
        
        
        
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
        /*UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            if (error == nil){
                print("Successful authoriation")
                application.registerForRemoteNotifications()
                NotificationCenter.default.addObserver(self, selector: #selector(self.refreshToken(notification:)), name: NSNotification.Name.InstanceIDTokenRefresh, object: nil)
                self.ConfigureNotifications()
            }
        }*/
        
        registerForPushNotifications()
        
        //application.registerForRemoteNotifications()
        //NotificationCenter.default.addObserver(self, selector: #selector(refreshToken(notification:)), name: NSNotification.Name.InstanceIDTokenRefresh, object: nil)
        
        //set up ads
        GADMobileAds.configure(withApplicationID: "ca-app-pub-1816441460162466~7930915740")
        
        
        return true
    }
    
    
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().delegate = self as! UNUserNotificationCenterDelegate
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
            // 1. Check if permission granted
            guard granted else { return }
            // 2. Attempt registration for remote notifications on the main thread
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func ConfigureNotifications(){
        // Create the custom actions for notification category.
        let favoriteAction = UNNotificationAction(identifier: "FAVORITE",
                                                title: "Favorite",
                                                options: UNNotificationActionOptions(rawValue: 0))
        let quoteCategory = UNNotificationCategory(identifier: "RECEIVED_QUOTE",
                                                     actions: [favoriteAction],
                                                     intentIdentifiers: [],
                                                     options: UNNotificationCategoryOptions(rawValue: 0))
        
        // Register the notification categories.
        let center = UNUserNotificationCenter.current()
        center.setNotificationCategories([quoteCategory])
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("DID CLICK ON NOTIFICATION")
            if response.actionIdentifier == "FAVORITE" {
                    print("Handle like action identifier")
                    print(response.notification.request.content.body)
                    
                    var quotes = Array(realm.objects(Quote.self))
                    for j in 0...(quotes.count - 1) {
                        if response.notification.request.content.body.range(of:(quotes[j].text)) != nil {
                            
                            let query : String = "id == " + String(quotes[j].id)
                            var theQuote = realm.objects(Quote.self).filter(query).first
                            try! realm.write {
                                if(theQuote?.favorite)!{
                                    theQuote!.favorite = false
                                    quotes[j].favorite = false
                                }
                                else {
                                    quotes[j].favorite = true
                                    theQuote!.favorite = true
                                }
                            }
                            theQuote = realm.objects(Quote.self).filter("favorite == true").first
                            
                            
                            
                        }
                    }
                    
                } else if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
                    notificationQuote = response.notification.request.content.body
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "frontPage") as! FrontPage
                    self.window?.rootViewController = nextViewController
                } else {
                    print("No custom action identifiers chosen")
                }
                // Make sure completionHandler method is at the bottom of this func
                completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(UNNotificationPresentationOptions.sound)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        //let defaults = UserDefaults.standard
        //defaults.set(favorites, forKey: "favorites")
        //defaults.set(dict, forKey: "unlockedPeople")
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
        //let defaults = UserDefaults.standard
        //defaults.set(favorites, forKey: "favorites")
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


