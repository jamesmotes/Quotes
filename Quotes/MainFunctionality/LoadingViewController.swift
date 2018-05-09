//
//  LoadingViewController.swift
//  Quotes
//
//  Created by James Motes on 5/7/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var activityIcon: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleSessionId(notification:)),
                                               name: PurchasesController.sessionIdSetNotification,
                                               object: nil)
        // Do any additional setup after loading the view.
        PurchasesController.shared.uploadReceipt()
        
    }
    @objc func handleSessionId(notification: Notification) {
        OperationQueue.main.addOperation { [weak self] in
            self?.configureView()
        }
        
        
        
        //navigationController?.isNavigationBarHidden = true
        //favButton.tintColor = UIColor.white
        
        /*quotes = Array(realm.objects(Quote.self))
         quotes.shuffle()
         
         if(notificationQuote != "") {
         for j in 0...(quotes.count - 1) {
         if notificationQuote.range(of:(quotes[j].text)) != nil {
         index = j
         notificationQuote = ""
         }
         }
         }*/
        
        
    }
    
    private func configureView() {
        
        activityIcon.stopAnimating()
        
        performSegue(withIdentifier: "loadFrontView", sender: nil)
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
