//
//  OnboardingViewController.swift
//  Voices
//
//  Created by Eliot Fowler on 1/18/15.
//  Copyright (c) 2015 Assembly. All rights reserved.
//

import UIKit
import QuartzCore

class OnboardingViewController: UIViewController, UIPageViewControllerDataSource {

    private var pageController: UIPageViewController?
    private var viewControllers: [OnboardingChildViewController] = []
    
    @IBOutlet weak var pageControllerContainer: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pageControlAppearance = UIPageControl.appearance()
        pageControlAppearance.pageIndicatorTintColor = UIColor(red: 239 / 255.0, green: 197.0 / 255.0, blue: 214 / 255.0, alpha: 1.0)
        pageControlAppearance.currentPageIndicatorTintColor = UIColor(red: 213 / 255.0, green: 72 / 255.0, blue: 122 / 255.0, alpha: 1.0)
        
        initializePageController()
        
        initializeButtonStyles()
    }
    
    func initializePageController() {
        var tutorialPageControl = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal , options: nil)
        tutorialPageControl.dataSource = self
        tutorialPageControl.view.frame = pageControllerContainer.bounds
        
        // Create the view controllers
        let intro = OnboardingChildViewController(nibName: "OnboardingChildViewController", bundle: nil)
        intro.index = 0
        intro.message = "Welcome to voices. Send and receive audio messages"
        
        let howTo = OnboardingChildViewController(nibName: "OnboardingChildViewController", bundle: nil)
        howTo.index = 1
        howTo.message = "Tap and hold to record your message."
        
        let final = OnboardingChildViewController(nibName: "OnboardingChildViewController", bundle: nil)
        final.index = 2
        final.message = "Tap and hold to record your message."
        
        viewControllers = [intro, howTo, final]
        tutorialPageControl.setViewControllers([intro], direction: .Forward, animated: false, completion: nil)
        
        pageController = tutorialPageControl
        
        self.addChildViewController(pageController!)
        pageControllerContainer.addSubview(pageController!.view)
        pageControllerContainer.backgroundColor = UIColor.clearColor()
        pageController!.didMoveToParentViewController(self)
    }
    
    func initializeButtonStyles() {
        let startColor = UIColor(red: 217 / 255.0, green: 105 / 255.0, blue: 87 / 255.0, alpha: 1)
        let endColor = UIColor(red: 213 / 255.0, green: 73 / 255.0, blue: 125 / 255.0, alpha: 1)
        
        loginButton.layer.cornerRadius = CGRectGetHeight(loginButton.bounds) / 2
        loginButton.clipsToBounds = true
        loginButton.backgroundColor = self.verticalGradient(startColor, toColor: endColor, height: CGRectGetHeight(loginButton.bounds))
        loginButton.titleLabel?.textColor = UIColor.whiteColor()
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        signupButton.layer.cornerRadius = CGRectGetHeight(loginButton.bounds) / 2
        signupButton.clipsToBounds = true
        signupButton.backgroundColor = self.verticalGradient(startColor, toColor: endColor, height: CGRectGetHeight(signupButton.bounds))
        signupButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    func verticalGradient(fromColor: UIColor, toColor: UIColor, height: CGFloat) -> UIColor {
        let size = CGSizeMake(1, height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorspace = CGColorSpaceCreateDeviceRGB()
        
        let colors = [fromColor.CGColor, toColor.CGColor]
        let gradient = CGGradientCreateWithColors(colorspace, colors, nil)
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, height), 0)
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext()
        
        return UIColor(patternImage: image)
    }
    
    //MARK: UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let index = (viewController as? OnboardingChildViewController)?.index {
            if(index >= viewControllers.count - 1) {
                return nil;
            } else {
                return viewControllers[index + 1];
            }
        } else {
            return nil;
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let index = (viewController as? OnboardingChildViewController)?.index {
            if(index == 0) {
                return nil;
            } else {
                return viewControllers[index - 1];
            }
        } else {
            return nil;
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
