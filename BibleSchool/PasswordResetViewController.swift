//
//  PasswordResetViewController.swift
//  BibleSchool
//
//  Created by David Young on 7/13/15.
//  Copyright (c) 2015 DRYoung. All rights reserved.
//

import UIKit
import Parse
import Bolts

class PasswordResetViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Button Logic
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sendButtonTapped(sender: AnyObject) {
        
        let emailAddress = emailAddressTextField.text
        
        if emailAddress.isEmpty {
            
            // Display error
            var alertMsg = UIAlertController(title: "Alert", message: "Email address required", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alertMsg.addAction(okAction)
            self.presentViewController(alertMsg, animated: true, completion: nil)
            return
        }
        
        PFUser.requestPasswordResetForEmailInBackground(emailAddress, block: { (success: Bool, error: NSError?) -> Void in
            
            var userMessage = "An email has been sent with password reset instructions."
            
            if !success {
                userMessage = error!.localizedDescription
            }
            
            // Display a message
            var okMsg = UIAlertController(title: "Success!", message: userMessage, preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "Ok", style: .Default) { action in
                if success {
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            }
            okMsg.addAction(okAction)
            self.presentViewController(okMsg, animated: true, completion: nil)
        })
    }
}
