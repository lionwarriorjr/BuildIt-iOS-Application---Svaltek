//
//  DetailViewController.swift
//  BuildIt!
//
//  Created by Srihari Mohan on 7/25/15.
//  Copyright (c) 2015 Srihari Mohan. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var project: Project!
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var baseImage: UIImageView!
    @IBOutlet weak var detailedDescLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descLabel.text = project.tableDesc
        self.baseImage.image = project.baseImage
        self.detailedDescLabel.text = project.description
        self.detailedDescLabel.scrollRangeToVisible(NSRange(location: 0,length: 0))
    }
}
