//
//  CollectionViewController.swift
//  BuildIt!
//
//  Created by Srihari Mohan on 7/25/15.
//  Copyright (c) 2015 Srihari Mohan. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var projectsArray = Project.demoSet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .Plain, target: self, action: "segueToHomeScreen")
    }

    func segueToHomeScreen() {
        self.performSegueWithIdentifier("showHomeFromCollectionView", sender: self)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.projectsArray.count;
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCollectionViewCell", forIndexPath: indexPath) as! MyCollectionViewCell
        
        let current_project = self.projectsArray[indexPath.item]
        let imageView = UIImageView(image: current_project.baseImage)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        cell.backgroundView = imageView
        
        return cell;
        
        //cell.myView = imageView
        //cell.myView = UIImageView(image: current_project.baseImage)
        //return cell;
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let puzzleVC = self.storyboard?.instantiateViewControllerWithIdentifier("PuzzleViewController") as! PuzzleViewController
        puzzleVC.project = self.projectsArray[indexPath.item]
        
        self.presentViewController(puzzleVC, animated: true, completion: nil)
    }
}
