//
//  StudentsViewController.swift
//  BibleSchool
//
//  Created by David Young on 7/15/15.
//  Copyright (c) 2015 DRYoung. All rights reserved.
//

import UIKit
import Parse
import Bolts

class StudentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var students: [PFObject] = []
    
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Populate data
        getStudents()
    }
    
    // MARK: - Data Interaction
    
    func getStudents() {
        var query = PFQuery(className:"Student")
        query.orderByAscending("lastName")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects!.count) students.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.students.append(object)
                    }
                    self.tableView.reloadData()
                }
            } else {
                // Log details of the failure
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
    }
    
    // MARK: - Button Logic
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        navigateToMainPage()
    }
    
    // MARK: - Table Logic
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        let student = students[row] as PFObject
        let firstName = student.valueForKey("firstName") as! String
        let lastName = student.valueForKey("lastName") as! String
        cell.textLabel!.text = "\(lastName), \(firstName)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        println(students[row])
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
}
