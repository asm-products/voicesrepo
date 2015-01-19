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
        let startColor = UIColor.redColor()//UIColor(red: 218 / 255.0, green: 158 / 255.0, blue: 66 / 255.0, alpha: 1)
        let endColor = UIColor.blueColor()//UIColor(red: 221 / 255.0, green: 150 / 255.0, blue: 186 / 255.0, alpha: 1)
        if(messageLabel != nil) {
            messageLabel.textColor = self.gradient(startColor, toColor: endColor, height: CGRectGetHeight(messageLabel.bounds))
        }
    }
    
    func gradient(fromColor: UIColor, toColor: UIColor, height: CGFloat) -> UIColor {
        let size = CGSizeMake(1, height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorspace = CGColorSpaceCreateDeviceRGB()
        
        let colors = [fromColor.CGColor, toColor.CGColor]
        let gradient = CGGradientCreateWithColors(colorspace, colors, nil)
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0)
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext()
        
        return UIColor(patternImage: image)
    }
}
