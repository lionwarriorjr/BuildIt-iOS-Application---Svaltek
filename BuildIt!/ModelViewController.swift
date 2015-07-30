//
//  ModelViewController.swift
//  BuildIt!
//
//  Created by Srihari Mohan on 7/28/15.
//  Copyright (c) 2015 Srihari Mohan. All rights reserved.
//

import Foundation
import UIKit

class ModelViewController: UIViewController {
    //preconfigured property
    var workspaceProject: Project!
    
    @IBOutlet weak var titleForView: UILabel!
    @IBOutlet weak var modelView: UIImageView!

    @IBAction func cancelModelView(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modelView.image = workspaceProject.baseImage
        self.titleForView.text = workspaceProject.name
    }
}
