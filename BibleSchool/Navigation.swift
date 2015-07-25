//
//  Navigation.swift
//  BibleSchool
//
//  Created by David Young on 7/19/15.
//  Copyright (c) 2015 DRYoung. All rights reserved.
//

import Foundation
import UIKit

func navigateToMainPage() {
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var page: MainPageViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainPageViewController") as! MainPageViewController
    var pageNav = UINavigationController(rootViewController: page)
    var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDelegate.window?.rootViewController = pageNav
}

func navigateToStudents(fromViewController: UIViewController) {
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var toViewNavController: UINavigationController = mainStoryboard.instantiateViewControllerWithIdentifier("StudentsNavController") as! UINavigationController
    fromViewController.presentViewController(toViewNavController, animated: true, completion: nil)
}