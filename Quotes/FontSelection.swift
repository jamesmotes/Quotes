//
//  FontSelection.swift
//  Quotes
//
//  Created by Blake Nelson on 4/22/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class FontSelection: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(goBack(_:)), name: Notification.Name(rawValue: "goBackFromCustomizationPage"), object: nil)
        
        let tableWidth = collectionView?.bounds.width
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        //layout.itemSize = CGSize(width: tableWidth!/3, height: tableWidth!/3)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    @objc func goBack(_ notification: Notification){
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        if(indexPath.row == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! TopCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FontCell
    
        // Configure the cell
        
        var fontStyle : String = String()
        var textColor = UIColor.white
        
        switch(indexPath.row){
        case 1:
            fontStyle = "Futura"
            textColor = UIColor.white
        case 2:
            fontStyle = "Zapfino"
            textColor = UIColor.blue
        default :
            fontStyle = "Symbol"
            textColor = UIColor.red
        }
        
        
        cell.name.font = UIFont(name: fontStyle, size: 20)
        cell.quote.font = UIFont(name: fontStyle, size: 30)
        cell.name.textColor = textColor
        cell.quote.textColor = textColor
        
    
        return cell
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
