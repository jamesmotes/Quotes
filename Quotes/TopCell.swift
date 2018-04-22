//
//  TopCell.swift
//  Quotes
//
//  Created by Blake Nelson on 4/22/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class TopCell: UICollectionViewCell {
    
    @IBAction func clickedBack(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "goBackFromCustomizationPage"), object: nil)
    }
}
