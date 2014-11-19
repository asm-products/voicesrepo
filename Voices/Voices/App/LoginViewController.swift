//
//  LoginViewController.swift
//  Voices
//
//  Created by Ben on 11/18/14.
//  Copyright (c) 2014 Assembly. All rights reserved.
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let authenticateButton = DGTAuthenticateButton(authenticationCompletion: {
          (session: DGTSession!, error: NSError!) in
          if (session != nil){
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let rootVC = storyboard.instantiateViewControllerWithIdentifier("rootVC") as RootViewController
            self.presentViewController(rootVC, animated: true, completion: nil)
          } else {
            var alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
          }
        })
        authenticateButton.center = self.view.center
        self.view.addSubview(authenticateButton)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
