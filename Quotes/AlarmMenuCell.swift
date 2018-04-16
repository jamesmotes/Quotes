//
//  AlarmMenuCell.swift
//  Quotes
//
//  Created by James Motes on 4/15/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class AlarmMenuCell: UITableViewCell {

    @IBOutlet weak var deleteButton: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        deleteButton.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func deleteAlarm(_ sender: UIButton) {
        print("Pressed delete")
    }
    
}
