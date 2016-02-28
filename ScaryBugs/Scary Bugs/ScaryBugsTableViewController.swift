//
//  ScaryBugsTableViewController.swift
//  Scary Bugs
//
//  Created by Aleksandr Pronin on 2/27/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class ScaryBugsTableViewController: UITableViewController {

    // MARK: - Vars
    var bugSections = [BugSection]()
    
    // MARK: - UITableViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = editButtonItem()
        setupBugs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let bugSection = bugSections[section]
        return ScaryBug.scaryFactorToString(bugSection.howScary)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return bugSections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let bugSection = bugSections[section]
        return bugSection.bugs.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BugCell", forIndexPath: indexPath)
        let bugSection = bugSections[indexPath.section]
        let bug = bugSection.bugs[indexPath.row]
        cell.textLabel?.text = bug.name
        cell.detailTextLabel?.text = ScaryBug.scaryFactorToString(bug.howScary)
        if let imageView = cell.imageView, bugImage = bug.image {
            imageView.image = bugImage
        }

        return cell
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            let bugSection = bugSections[indexPath.section]
            bugSection.bugs.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    // MARK: - Private
    
    private func setupBugs() {
        bugSections.append(BugSection(howScary: .NotScary))
        bugSections.append(BugSection(howScary: .ALittleScary))
        bugSections.append(BugSection(howScary: .AverageScary))
        bugSections.append(BugSection(howScary: .QuiteScary))
        bugSections.append(BugSection(howScary: .Aiiiiieeeee))
        
        let bugs = ScaryBug.bugs()
        for bug: ScaryBug in bugs {
            let bugSection = bugSections[bug.howScary.rawValue]
            bugSection.bugs.append(bug)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
