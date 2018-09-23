//
//  FontCell.swift
//  Quotes
//
//  Created by Blake Nelson on 4/22/18.
//  Copyright © 2018 JDM. All rights reserved.
//

import UIKit

class FontCell: UICollectionViewCell {
    
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var deleteImage: UIImageView!
    
    var delete = false
    
    var shakeEnabled: Bool!
    
    func shakeIcons() {
        let shakeAnimation = CABasicAnimation(keyPath: "transform.rotation")
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 2
        shakeAnimation.autoreverses = true
        let startAngle: Float = (-2) * 3.14159/180
        let stopAngle = -startAngle
        shakeAnimation.fromValue = NSNumber(value: startAngle as Float)
        shakeAnimation.toValue = NSNumber(value: 3 * stopAngle as Float)
        shakeAnimation.autoreverses = true
        shakeAnimation.duration = 0.2
        shakeAnimation.repeatCount = 10000
        shakeAnimation.timeOffset = 290 * drand48()
        
        //let layer: CALayer = self.layer
        //layer.add(shakeAnim, forKey:"shaking")
        shakeEnabled = true
        self.deleteImage.isHidden = false
    }
    
    func stopShakingIcons() {
        let layer: CALayer = self.layer
        layer.removeAnimation(forKey: "shaking")
        self.deleteImage.isHidden = true
        shakeEnabled = false
    }
    
}
