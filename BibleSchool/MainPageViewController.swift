//
//  MainPageViewController.swift
//  BibleSchool
//
//  Created by David Young on 7/13/15.
//  Copyright (c) 2015 DRYoung. All rights reserved.
//

import UIKit
import Parse
import Bolts

class MainPageViewController: UIViewController {

    @IBOutlet weak var imageViewInfo: UIImageView!
    @IBOutlet weak var imageViewStudents: UIImageView!
    @IBOutlet weak var imageViewVolunteers: UIImageView!
    @IBOutlet weak var imageViewSchedule: UIImageView!
    @IBOutlet weak var imageViewClasses: UIImageView!
    @IBOutlet weak var imageViewActivities: UIImageView!
    @IBOutlet weak var imageViewContacts: UIImageView!
    @IBOutlet weak var imageViewNotes: UIImageView!
    @IBOutlet weak var imageViewSettings: UIImageView!
    
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var labelStudents: UILabel!
    @IBOutlet weak var labelVolunteers: UILabel!
    @IBOutlet weak var labelSchedule: UILabel!
    @IBOutlet weak var labelClasses: UILabel!
    @IBOutlet weak var labelActivities: UILabel!
    @IBOutlet weak var labelContacts: UILabel!
    @IBOutlet weak var labelNotes: UILabel!
    @IBOutlet weak var labelSettings: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRoundedCorners()
        addGestureRecognizers()
    }
    
    // MARK: - Handle Gestures
    
    func addGestureRecognizers() {
        imageViewInfo.userInteractionEnabled = true
        let tapGesture1a = UITapGestureRecognizer(target: self, action: "infoTapped")
        imageViewInfo.addGestureRecognizer(tapGesture1a)
        labelInfo.userInteractionEnabled = true
        let tapGesture1b = UITapGestureRecognizer(target: self, action: "infoTapped")
        labelInfo.addGestureRecognizer(tapGesture1b)
        
        imageViewStudents.userInteractionEnabled = true
        let tapGesture2a = UITapGestureRecognizer(target: self, action: "studentsTapped")
        imageViewStudents.addGestureRecognizer(tapGesture2a)
        labelStudents.userInteractionEnabled = true
        let tapGesture2b = UITapGestureRecognizer(target: self, action: "studentsTapped")
        labelStudents.addGestureRecognizer(tapGesture2b)
        
        imageViewVolunteers.userInteractionEnabled = true
        let tapGesture3a = UITapGestureRecognizer(target: self, action: "volunteersTapped")
        imageViewVolunteers.addGestureRecognizer(tapGesture3a)
        labelVolunteers.userInteractionEnabled = true
        let tapGesture3b = UITapGestureRecognizer(target: self, action: "volunteersTapped")
        labelVolunteers.addGestureRecognizer(tapGesture3b)
        
        imageViewSchedule.userInteractionEnabled = true
        let tapGesture4a = UITapGestureRecognizer(target: self, action: "scheduleTapped")
        imageViewSchedule.addGestureRecognizer(tapGesture4a)
        labelSchedule.userInteractionEnabled = true
        let tapGesture4b = UITapGestureRecognizer(target: self, action: "scheduleTapped")
        labelSchedule.addGestureRecognizer(tapGesture4b)
        
        imageViewClasses.userInteractionEnabled = true
        let tapGesture5a = UITapGestureRecognizer(target: self, action: "classesTapped")
        imageViewClasses.addGestureRecognizer(tapGesture5a)
        labelClasses.userInteractionEnabled = true
        let tapGesture5b = UITapGestureRecognizer(target: self, action: "classesTapped")
        labelClasses.addGestureRecognizer(tapGesture5b)
        
        imageViewActivities.userInteractionEnabled = true
        let tapGesture6a = UITapGestureRecognizer(target: self, action: "activitiesTapped")
        imageViewActivities.addGestureRecognizer(tapGesture6a)
        labelActivities.userInteractionEnabled = true
        let tapGesture6b = UITapGestureRecognizer(target: self, action: "activitiesTapped")
        labelActivities.addGestureRecognizer(tapGesture6b)
        
        imageViewContacts.userInteractionEnabled = true
        let tapGesture7a = UITapGestureRecognizer(target: self, action: "contactsTapped")
        imageViewContacts.addGestureRecognizer(tapGesture7a)
        labelContacts.userInteractionEnabled = true
        let tapGesture7b = UITapGestureRecognizer(target: self, action: "contactsTapped")
        labelContacts.addGestureRecognizer(tapGesture7b)
        
        imageViewNotes.userInteractionEnabled = true
        let tapGesture8a = UITapGestureRecognizer(target: self, action: "notesTapped")
        imageViewNotes.addGestureRecognizer(tapGesture8a)
        labelNotes.userInteractionEnabled = true
        let tapGesture8b = UITapGestureRecognizer(target: self, action: "notesTapped")
        labelNotes.addGestureRecognizer(tapGesture8b)
        
        imageViewSettings.userInteractionEnabled = true
        let tapGesture9a = UITapGestureRecognizer(target: self, action: "settingsTapped")
        imageViewSettings.addGestureRecognizer(tapGesture9a)
        labelSettings.userInteractionEnabled = true
        let tapGesture9b = UITapGestureRecognizer(target: self, action: "settingsTapped")
        labelSettings.addGestureRecognizer(tapGesture9b)
    }
    
    func infoTapped() {
        println("Info!")
    }
    
    func studentsTapped() {
        navigateToStudents(self)
//        let toViewController: StudentsViewController = StudentsViewController()
//        self.presentViewController(toViewController, animated: true, completion: nil)
    }
    
    func volunteersTapped() {
        println("Volunteers!")
    }
    
    func scheduleTapped() {
        println("Schedule!")
    }
    
    func classesTapped() {
        println("Classes!")
    }
    
    func activitiesTapped() {
        println("Activities!")
    }
    
    func contactsTapped() {
        println("Contacts!")
    }
    
    func notesTapped() {
        println("Notes!")
    }
    
    func settingsTapped() {
        println("Settings!")
    }
    
    // MARK: - Image Display
    
    func addRoundedCorners() {
        addRoundedCorners(imageViewInfo)
        addRoundedCorners(imageViewStudents)
        addRoundedCorners(imageViewVolunteers)
        addRoundedCorners(imageViewSchedule)
        addRoundedCorners(imageViewClasses)
        addRoundedCorners(imageViewActivities)
        addRoundedCorners(imageViewContacts)
        addRoundedCorners(imageViewNotes)
        addRoundedCorners(imageViewSettings)
    }
    
    func addRoundedCorners(imageView: UIImageView) {
        imageView.layer.cornerRadius = cROUNDED_RADIUS
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.darkGrayColor().CGColor
        imageView.layer.borderWidth = 3
    }

    // MARK: - Button Logic
    
    @IBAction func signOutButtonTapped(sender: AnyObject) {
    
        NSUserDefaults.standardUserDefaults().removeObjectForKey("username")
        NSUserDefaults.standardUserDefaults().synchronize()
                
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) -> Void in
            
            // TODO: - Send to login page (needs to be common func)
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            var page: LoginViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
            var pageNav = UINavigationController(rootViewController: page)
            var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.window?.rootViewController = pageNav
        }
        
    }
}
