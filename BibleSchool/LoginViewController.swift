//
//  ViewController.swift
//  BibleSchool
//
//  Created by David Young on 7/12/15.
//  Copyright (c) 2015 DRYoung. All rights reserved.
//

import UIKit
import Parse
import Bolts

class LoginViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Button Logic
    
    @IBAction func signInButtonTapped(sender: AnyObject) {
        
        let emailAddress = emailAddressTextField.text
        let password = passwordTextField.text
        
        if emailAddress.isEmpty || password.isEmpty {
            
            // Display error
            var alertMsg = UIAlertController(title: "Alert", message: "All fields required", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alertMsg.addAction(okAction)
            self.presentViewController(alertMsg, animated: true, completion: nil)
            return
        }
        
        PFUser.logInWithUsernameInBackground(emailAddress, password: password) { (userObject: PFUser?, error: NSError?) -> Void in
            
            if error != nil {
                var okMsg = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .Alert)
                let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                okMsg.addAction(okAction)
                self.presentViewController(okMsg, animated: true, completion: nil)
                return
            }
            
            // Save in memory
            NSUserDefaults.standardUserDefaults().setValue(emailAddress, forKey: "username")
            // possibly get ACL from user object
            NSUserDefaults.standardUserDefaults().synchronize()
            
            // Perform navigation
            navigateToMainPage()
        }
    }
    
    // MARK: - Navigation
    
    func sendToMainPage() {
        
    }
}

