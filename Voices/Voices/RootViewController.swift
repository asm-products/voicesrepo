//
//  ViewController.swift
//  Voices
//
//  Created by Mazyad Alabduljaleel on 11/1/14.
//  Copyright (c) 2014 Assembly. All rights reserved.
//

import UIKit

/** The root view controller contains the whole app, and manages the
 *  content scroll view which contains the content view controllers
 */
class RootViewController: UIViewController {
    
    private let contentViewControllers: [UIViewController]
    
    
    @IBOutlet var contentScrollView: UIScrollView?

    
    required init(coder aDecoder: NSCoder) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        contentViewControllers = [
            "ContactsViewController",
            "RecordViewController",
            "InboxViewController"
        ].map {
            mainStoryboard.instantiateViewControllerWithIdentifier($0) as UIViewController
        }
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Keep calm, and assert all your assumptions
        assert(contentScrollView != nil, "Content scroll view must be connected in IB")
        let scrollView = contentScrollView!
        scrollView.contentSize.width = CGFloat(contentViewControllers.count) * self.view.bounds.width
        scrollView.contentOffset.x = self.view.bounds.width
        
        var xOffset = CGFloat(0)
        for viewController in contentViewControllers {
            viewController.view.frame.origin.x = xOffset
            viewController.view.frame.size = scrollView.bounds.size
            scrollView.addSubview(viewController.view)
            
            xOffset += self.view.bounds.width
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}

/** Subclass the Root view to draw the background gradient
 */
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

