//
//  TableViewSpecs.swift
//  BuildIt!
//
//  Created by Srihari Mohan on 7/25/15.
//  Copyright (c) 2015 Srihari Mohan. All rights reserved.
//

import Foundation
import UIKit

class TableViewSpecs: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var projectsArray = Project.demoSet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .Plain, target: self, action: "showProfile")
    }
    
    func showProfile() {
        self.performSegueWithIdentifier("showProfileScreen", sender: self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.projectsArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellForProject") as! UITableViewCell
        let currentProject = self.projectsArray[indexPath.row];
        cell.imageView?.image = currentProject.baseImage
        cell.textLabel?.text = currentProject.name
        cell.detailTextLabel?.text = currentProject.tableDesc
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        detailVC.project = self.projectsArray[indexPath.row]
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
