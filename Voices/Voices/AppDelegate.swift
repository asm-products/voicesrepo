//
//  AppDelegate.swift
//  Voices
//
//  Created by Mazyad Alabduljaleel on 11/1/14.
//  Copyright (c) 2014 Assembly. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Crashlytics()])
        return true
    }
}

