//
//  OnboardingChildViewController.swift
//  Voices
//
//  Created by Eliot Fowler on 1/18/15.
//  Copyright (c) 2015 Assembly. All rights reserved.
//

import UIKit

class OnboardingChildViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var voicesLabel: UILabel!
    
    var message: String?
    var image: UIImage?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientSetup()
        
        if(message != nil && messageLabel != nil) {
            messageLabel.text = message
        }
        
        if(image != nil && imageView != nil) {
            imageView.image = image
        }
    }
    
    func gradientSetup() {
        let startColor = UIColor(red: 220 / 255.0, green: 142 / 255.0, blue: 54 / 255.0, alpha: 1)
        let endColor = UIColor(red: 213 / 255.0, green: 71 / 255.0, blue: 123 / 255.0, alpha: 1)
        if(messageLabel != nil) {
            messageLabel.textColor = self.horizontalGradient(startColor, toColor: endColor)
        }
        
        if(voicesLabel != nil) {
            voicesLabel.textColor = self.horizontalGradient(startColor, toColor: endColor)
        }
    }
    
    func horizontalGradient(fromColor: UIColor, toColor: UIColor) -> UIColor {
        let labelTextWidth = messageLabel!.intrinsicContentSize().width
        let labelTextHeight = messageLabel!.intrinsicContentSize().height
        
        let size = CGSizeMake(labelTextWidth, 1)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorspace = CGColorSpaceCreateDeviceRGB()
        
        let colors = [fromColor.CGColor, toColor.CGColor]
        let gradient = CGGradientCreateWithColors(colorspace, colors, nil)
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(labelTextWidth, 0), 0)
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext()
        
        return UIColor(patternImage: image)
    }
}
