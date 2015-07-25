//
//  SignUpViewController.swift
//  BibleSchool
//
//  Created by David Young on 7/12/15.
//  Copyright (c) 2015 DRYoung. All rights reserved.
//

import UIKit
import Parse
import Bolts

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Button Logic
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func signUpButtonTapped(sender: AnyObject) {
    
        let emailAddress = emailAddressTextField.text
        let password = passwordTextField.text
        let repeatPassword = repeatPasswordTextField.text
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        
        // Test for empty fields
        if emailAddress.isEmpty || password.isEmpty || repeatPassword.isEmpty || firstName.isEmpty || lastName.isEmpty {
            displayAlertMessage("All fields are required")
            return
        }
        
        // Test for matching fields
        if password != repeatPassword {
            displayAlertMessage("Password fields do not match")
            return
        }
        
        // Store the data
        let userObject: PFUser = PFUser()
        userObject.username = emailAddress
        userObject.email = emailAddress
        userObject.password = password
        userObject.setValue(firstName, forKey: "firstName")
        userObject.setValue(lastName, forKey: "lastName")


        userObject.signUpInBackgroundWithBlock { (success: Bool, error:NSError?) -> Void in
            
            var userMessage = "Registration was successful. Please login with your credentials."
            
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
        }
    }
    
    func displayAlertMessage(message: String) {
        var alertMsg = UIAlertController(title: "Alert", message: message, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertMsg.addAction(okAction)
        
        self.presentViewController(alertMsg, animated: true, completion: nil)
    }
}
