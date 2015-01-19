//
//  OnboardingViewController.swift
//  Voices
//
//  Created by Eliot Fowler on 1/18/15.
//  Copyright (c) 2015 Assembly. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UIPageViewControllerDataSource {

    private var pageControl: UIPageViewController?
    private var viewControllers: [OnboardingChildViewController] = []
    @IBOutlet weak var pageControllerContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        pageControl = tutorialPageControl
        
        self.addChildViewController(pageControl!)
        pageControllerContainer.addSubview(pageControl!.view)
        pageControl!.didMoveToParentViewController(self)
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
