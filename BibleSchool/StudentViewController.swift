//
//  StudentViewController.swift
//  BibleSchool
//
//  Created by David Young on 7/20/15.
//  Copyright (c) 2015 DRYoung. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Button Logic
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
