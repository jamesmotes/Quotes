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
//import FirebaseDatabase
import RealmSwift
import GoogleMobileAds
import StoreKit
import SwiftyStoreKit
import FBSDKCoreKit

var notificationQuote : String = ""

var full_unlock = false
var monthly_unlock = false
var full_access = false

var DEVELOPMENT = false

var influencers : [Influencer] = []


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    var window: UIWindow?
    var isInitialized = false
    
    let realm = try! Realm()
    
    var notify = false
    
    
    var usedImages : [String] = []
    var newInfluencerImages : [InfluencerImage] = []
    
    override init() {
    }

    // Facebook Ads
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options);
        
        return handled
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        // Facebook Ads
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions);
        
        //UIApplication.shared.registerForRemoteNotifications()
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        
        
        application.registerForRemoteNotifications()
        SKPaymentQueue.default().add(self)
        
        PurchasesController.shared.loadSubscriptionOptions()
        
        let defaults = UserDefaults.standard
        
        
        //defaults.set(false, forKey: "full_unlock")
        
        if (defaults.bool(forKey: "updated") == false){
            updateDatabase()
            loadQuotes2()
            var _ : LoadThemes = LoadThemes()
            var _ : LoadThemes2 = LoadThemes2()
            defaults.set(true, forKey: "updated")
        }
        if(defaults.bool(forKey: "HasBeenLaunched") == false){
            defaults.set(true, forKey: "FirstUpdate")
            defaults.set(true, forKey: "SecondUpdate")
            defaults.set(true, forKey: "ThirdUpdate")
            defaults.set(true, forKey: "FourthUpdate")
            defaults.set(true, forKey: "SixthUpdate")
            defaults.set([], forKey: "AlarmSetPeople")
            defaults.set([], forKey: "AlarmSetTime")
            defaults.set(true, forKey: "HasBeenLaunched")
            defaults.set(3, forKey: "reviewCountdown")
            //defaults.set(false, forKey: "full_unlock")
            defaults.set(false, forKey: "whiteBackground")
            globalTheme.setTextColor(color: UIColor.white)
            globalTheme.font = "Georgia"
            globalTheme.setBackgroundColor(color: UIColor.black)
            globalTheme.imageFile = "Colorcloud.jpg"
            let initialImage = UIImage(named: "Colorcloud.jpg")
            globalTheme.setImage(_image: initialImage)
            globalTheme.whiteBackground = false
            storeCustomiationInfo()
        }
        else{
            //App Update

            if(defaults.bool(forKey: "ThirdUpdate") == false){
                
                updateDatabase()
                var _ : LoadThemes2 = LoadThemes2()
                defaults.set(true, forKey: "ThirdUpdate")
            }
            else if(defaults.bool(forKey: "FourthUpdate") == false){
                let allThemes = realm.objects(Theme.self)
                for t in allThemes {
                    try! realm.write {
                        realm.delete(t)
                    }
                }
                
                var _ : LoadThemes = LoadThemes()
                var _ : LoadThemes2 = LoadThemes2()
            } else {
                globalTheme.image = defaults.data(forKey: "image") as! NSData
            }
            defaults.set(true, forKey: "FourthUpdate")
            
            if defaults.bool(forKey: "SixthUpdate") == false {
                var _ : LoadQuotes2 = LoadQuotes2()
                defaults.set(true, forKey: "SixthUpdate")
            }
            
            // TODO: Change to global Schema object
            AlarmSetPeople = defaults.array(forKey: "AlarmSetPeople") as! [String]
            AlarmSetTime = defaults.array(forKey: "AlarmSetTime") as! [DateComponents]
            quoteIterator = defaults.integer(forKey: "quoteIterator")
            globalTheme.setTextColor(color: defaults.colorForKey(key: "fontColor")!)
            globalTheme.font = defaults.string(forKey: "fontStyle")!
            globalTheme.setBackgroundColor(color: defaults.colorForKey(key: "backgroundColor")!)
            globalTheme.imageFile = defaults.string(forKey: "imageFile")!
            globalTheme.whiteBackground = defaults.bool(forKey: "whiteBackground")
            numBackgrounds = defaults.integer(forKey: "numBackgrounds")
        }
        
        if(defaults.integer(forKey: "reviewCountdown") == 0){
            if #available( iOS 10.3,*){
                SKStoreReviewController.requestReview()
            }
            defaults.set(10, forKey: "reviewCountdown")
        } else {
            let countdown = defaults.integer(forKey: "reviewCountdown") - 1
            defaults.set(countdown, forKey: "reviewCountdown")
        }
        
        
        registerForPushNotifications()
        ConfigureNotifications()
        

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            if (error == nil){
                print("Successful authoriation")
            }
        }
        application.registerForRemoteNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshToken(notification:)), name: NSNotification.Name.InstanceIDTokenRefresh, object: nil)

        
       Messaging.messaging().shouldEstablishDirectChannel = false
        
        //set up ads
        GADMobileAds.configure(withApplicationID: "ca-app-pub-1816441460162466~9409574717")
        
        
        print(PurchasesController.shared.currentSessionId)
        
        // Check if launched from notification
        // 1
        if let notification = launchOptions?[.remoteNotification] as? [String: AnyObject] {
            // 2
            let aps = notification
            makeNewQuote(aps: aps)
            // 3
            //(window?.rootViewController as? UITabBarController)?.selectedIndex = 1
        }
        
        
        //loadInfluencers()
        
        //Swifty Store Kit Setup
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
            for purchase in purchases {
                switch purchase.transaction.transactionState {
                case .purchased, .restored:
                    if purchase.needsFinishTransaction {
                        // Deliver content from server, then:
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                full_unlock = true
                case .failed, .purchasing, .deferred:
                    break // do nothing
                }
            }
        }
        
        
        //subsription stuff
        /*guard PurchasesController.shared.currentSessionId != nil,
            PurchasesController.shared.hasReceiptData else {
                return true
        }
        monthly_unlock = true
        
        
        
        full_unlock = defaults.bool(forKey: "full_unlock")
        //full_unlock = true
        print(full_unlock)
        
        
        if(monthly_unlock || full_unlock){
            full_unlock = true
        }
*/
        return true
    }
    
    
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
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
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    
    func application(application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken as Data
    }
    
    func application(application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        Messaging.messaging().apnsToken = deviceToken as Data
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
                    print(response)
                    print(notificationQuote)
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
    
    func makeNewQuote(aps : [String : AnyObject]){
        print(aps)
    }
    
    //Firebase notification handling
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        //if let messageID = userInfo[gcmMessageIDKey] {
        //    print("Message ID: \(messageID)")
        //}
        
        // Print full message.
        print(userInfo)
    }
    
    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        //if let messageID = userInfo[gcmMessageIDKey] {
        //    print("Message ID: \(messageID)")
        //}
        
        // Print full message.
        
        
        
        print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    //end of firebase notification handling
    
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
        
        
        storeCustomiationInfo()
        
        let storedImages = Array(self.realm.objects(InfluencerImage.self))
        for i in storedImages {
            if !usedImages.contains(i.name) {
                try! self.realm.write {
                    self.realm.delete(i)
                }
            }
        }
        for i in newInfluencerImages {
            try! self.realm.write {
                self.realm.add(i)
            }
        }
        let images = Array(self.realm.objects(InfluencerImage.self))
        newInfluencerImages = []
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
        
        storeCustomiationInfo()
        print("terminating")
        
        let storedImages = Array(self.realm.objects(InfluencerImage.self))
        for i in storedImages {
            if !usedImages.contains(i.name) {
                try! self.realm.write {
                    self.realm.delete(i)
                }
            }
        }
        for i in newInfluencerImages {
            try! self.realm.write {
                self.realm.add(i)
            }
        }
        let images = Array(self.realm.objects(InfluencerImage.self))
        newInfluencerImages = []
        
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
        reloadQuotes()
        var _ : LoadQuotes = LoadQuotes()
        //var _ : LoadSchemas = LoadSchemas()
        //var _ : LoadThemes = LoadThemes()
        
        
        let defaults = UserDefaults.standard
        defaults.set(quoteIterator, forKey: "quoteIterator")
    }
    
    func reloadQuotes(){
        let allQuotes = realm.objects(Quote.self)
        for q in allQuotes {
            if (q.custom == false){
                try! realm.write {
                    realm.delete(q)
                }
            }
        }
        quoteIterator = 0
    }
    
    func loadQuotes2(){
        var _ : LoadQuotes2 = LoadQuotes2()
    }
    
    func storeCustomiationInfo() {
        // TODO: Change to global Theme object
        let defaults = UserDefaults.standard
        defaults.setColor(color: globalTheme.getTextColor(), forKey: "fontColor")
        defaults.set(globalTheme.font, forKey: "fontStyle")
        defaults.setColor(color: globalTheme.getBackgroundColor(), forKey: "backgroundColor")
        defaults.set(globalTheme.imageFile, forKey: "imageFile")
        defaults.set(globalTheme.whiteBackground, forKey: "whiteBackground")
        
        defaults.set(globalTheme.image, forKey: "image")
    }
    
    func setStandardAlarms(){
        let date = Date.init()
        var triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        triggerDate.second = 0
        
        var quotes = Array(realm.objects(Quote.self))
        quotes.shuffle()
        
        var count = 0
        
        while count < quotes.count {
            let q = quotes[count]
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
            
            triggerDate.hour = 17
            triggerDate.minute = 32
            
            var trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
            
            var identifier = "standard_" + (String)(count)
            var request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    // Something went wrong
                    print("something went wrong when adding the notification to the request center")
                }
            })
            count += 1
            
            triggerDate.hour = 16
            triggerDate.minute = 20
            
            trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
            
            identifier = "standard_" + (String)(count)
            request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
            center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    // Something went wrong
                    print("something went wrong when adding the notification to the request center")
                }
            })
            count += 1
            
            triggerDate.hour = 22
            triggerDate.minute = 20
            
            trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
            
            identifier = "standard_" + (String)(count)
            request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    // Something went wrong
                    print("something went wrong when adding the notification to the request center")
                }
            })
            count += 1
        }
    }
        
        
    
    //print("TriggerDate")
    //print(triggerDate)
    
    
    
    
    
    /*func loadInfluencers() {
        //load influencers
        
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        _ = ref.child("Influencers").observeSingleEvent(of: .value, with: { (snapshot) in
            let influencerList = snapshot.value as? NSDictionary
            for (_, inf) in influencerList! {
                let influencer = inf as? NSDictionary
                let newInf : Influencer = Influencer()
                for(key, handle) in influencer! {
                    if(key as! String == "insta") {
                        newInf.insta = handle as! String
                    }
                    else if(key as! String == "name") {
                        newInf.name = handle as! String
                    }
                    else if(key as! String == "twitter") {
                        newInf.twitter = handle as! String
                    }
                    else if(key as! String == "website") {
                        newInf.website = handle as! String
                    }
                    else if(key as! String == "youtube") {
                        newInf.youtube = handle as! String
                    }
                    else if(key as! String == "imageURL") {
                        newInf.imageURL = handle as! String
                    }
                }
                
                //get influencer image
                //check realm for image first
                let query = "name CONTAINS '" + newInf.name + "'"
                let allImages = Array(self.realm.objects(InfluencerImage.self))
                let storedImages = Array(self.realm.objects(InfluencerImage.self).filter(query))
                if storedImages.count > 0 {
                    let storedImage = storedImages[0]
                    newInf.image = storedImage.getImage()!
                }
                else {
                    let url = NSURL(string: newInf.imageURL)
                    URLSession.shared.dataTask(with: url! as URL, completionHandler: {(data, response, error) in
                        if error != nil {
                            print(error as Any)
                            return
                        }
                        newInf.image = UIImage(data: data!)!
                        let InfImage = InfluencerImage()
                        InfImage.name = newInf.name
                        InfImage.setImage(_image: newInf.image)
                        self.newInfluencerImages.append(InfImage)
                    }).resume()
                }
                self.usedImages.append(newInf.imageURL)
                
                
                
                influencers.append(newInf)
                for infl in influencers {
                    print(infl.name)
                    print(infl.insta)
                    print(infl.twitter)
                    print(infl.website)
                    print(infl.youtube)
                }
            }
        })
        //TODO Clear Realm of unused influencer images and store all current images
        
    }*/

}

extension AppDelegate: SKPaymentTransactionObserver {
    
    func paymentQueue(_ queue: SKPaymentQueue,
                      updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                handlePurchasingState(for: transaction, in: queue)
            case .purchased:
                handlePurchasedState(for: transaction, in: queue)
            case .restored:
                handleRestoredState(for: transaction, in: queue)
            case .failed:
                handleFailedState(for: transaction, in: queue)
            case .deferred:
                handleDeferredState(for: transaction, in: queue)
            }
        }
        
    }
    
    func handlePurchasingState(for transaction: SKPaymentTransaction, in queue: SKPaymentQueue) {
        print("User is attempting to purchase product id: \(transaction.payment.productIdentifier)")
        
    }
    
    func handlePurchasedState(for transaction: SKPaymentTransaction, in queue: SKPaymentQueue) {
        print("User purchased product id: \(transaction.payment.productIdentifier)")
        
        queue.finishTransaction(transaction)
        PurchasesController.shared.uploadReceipt { (success) in
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: PurchasesController.purchaseSuccessfulNotification, object: nil)
                full_unlock = true
            }
        }
    }
    
    func handleRestoredState(for transaction: SKPaymentTransaction, in queue: SKPaymentQueue) {
        print("Purchase restored for product id: \(transaction.payment.productIdentifier)")
        queue.finishTransaction(transaction)
        PurchasesController.shared.uploadReceipt { (success) in
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: PurchasesController.restoreSuccessfulNotification, object: nil)
            }
        }
    }
    
    func handleFailedState(for transaction: SKPaymentTransaction, in queue: SKPaymentQueue) {
        print("Purchase failed for product id: \(transaction.payment.productIdentifier)")
    }
    
    func handleDeferredState(for transaction: SKPaymentTransaction, in queue: SKPaymentQueue) {
        print("Purchase deferred for product id: \(transaction.payment.productIdentifier)")
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


extension UserDefaults {
    func colorForKey(key: String) -> UIColor? {
        var color: UIColor?
        if let colorData = data(forKey: key) {
            color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
        }
        return color
    }
    func setColor(color: UIColor?, forKey key: String) {
        var colorData: NSData?
        if let color = color {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
        }
        set(colorData, forKey: key)// UserDefault Built-in Method into Any?
    }
    
}





