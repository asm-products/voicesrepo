//
//  ViewController.swift
//  Voices
//
//  Created by Mazyad Alabduljaleel on 11/1/14.
//  Copyright (c) 2014 Assembly. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}

class RootView: UIView {
    
    override class func layerClass() -> AnyClass {
        return CAGradientLayer.self
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let gradientLayer = layer as CAGradientLayer
        gradientLayer.colors = [
            UIColor.orangeColor().CGColor,
            UIColor.redColor().CGColor
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        contentMode = .Redraw
    }
    
}

