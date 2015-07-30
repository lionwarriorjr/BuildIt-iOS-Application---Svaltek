//
//  PuzzleViewController.swift
//  BuildIt!
//
//  Created by Srihari Mohan on 7/25/15.
//  Copyright (c) 2015 Srihari Mohan. All rights reserved.
//

import Foundation
import UIKit

class PuzzleViewController: UIViewController, UIGestureRecognizerDelegate {
    //guaranteed to be preconfigured
    var project: Project!
    var assocImages = [UIImage]()
    
    static let toolbarHeight:CGFloat = 44, toolbarWidth:CGFloat = 44
    
    @IBOutlet weak var puzzleToolbar: UIToolbar!
    
    @IBAction func showModel(sender: UIBarButtonItem) {
        //instantiate ViewController all through code
        let modelVC = self.storyboard?.instantiateViewControllerWithIdentifier("ModelViewController") as! ModelViewController
        let data = self.project
        modelVC.workspaceProject = data
        self.presentViewController(modelVC, animated: true, completion: nil)
    }
    
    @IBAction func post(sender: UIBarButtonItem) {
        let puzzledImage = generatePuzzledImage()
        let activityVC = UIActivityViewController(activityItems: [puzzledImage], applicationActivities: nil)
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
    
    
    @IBAction func print(sender: UIBarButtonItem) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://shapeways.com")!)
    }
    
    func generatePuzzledImage() -> UIImage {
        self.puzzleToolbar.hidden = true
        
        //Render view to an image
        //Begin creating an image context
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        //Get current image context
        let puzzledImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        //End image current image context
        UIGraphicsEndImageContext()
        
        self.puzzleToolbar.hidden = false
        
        return puzzledImage;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.assocImages = project.associatedImages
        
        /* App delegate shared data */
        (UIApplication.sharedApplication().delegate as! AppDelegate).workspaceProject = self.project
        
        for(var i=1; i <= self.assocImages.count; ++i) {
            var currentString = "\(self.project.name)_subimage_\(i)"
            let my_image = UIImage(named: currentString)!
            let my_imageView = UIImageView(image: my_image)
            var originalWidth = my_image.size.width
            println(originalWidth)
            var originalHeight = my_image.size.height
            println(originalHeight)
            let viewWidth = self.view.frame.width - PuzzleViewController.toolbarWidth * 2.0
            let viewHeight = self.view.frame.height - PuzzleViewController.toolbarHeight * 2.0
            let xwidth = viewWidth - originalWidth
            let yheight = viewHeight - originalHeight
            let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
            let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
            var random_x: CGFloat = xoffset + originalWidth / 2
            var random_y: CGFloat = yoffset + originalHeight / 2
            my_imageView.frame = CGRectMake(random_x, random_y, originalWidth, originalHeight)
            self.view.addSubview(my_imageView)
        }
        
        //1
        let filteredSubviews = self.view.subviews.filter({
            $0.isKindOfClass(UIImageView) })
        // 2
        for view in filteredSubviews  {
            // 3
            let pan_recognizer = UIPanGestureRecognizer(target: self, action:Selector("handleTap:"))
            let rotation_recognizer = UIRotationGestureRecognizer(target: self, action: Selector("handleRotation:"))
            // 4
            pan_recognizer.delegate = self
            (view as? UIView)?.userInteractionEnabled = true
            view.addGestureRecognizer(pan_recognizer)
            view.addGestureRecognizer(rotation_recognizer)
        }
    }
    
    @IBAction func dismissVC(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true;
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        return true;
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailByGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true;
    }
    
    func handleTap(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }
    
    func handleRotation(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformRotate(view.transform, recognizer.rotation)
            recognizer.rotation = 0
        }
    }
}
