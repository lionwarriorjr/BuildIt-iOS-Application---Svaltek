//
//  ViewController.swift
//  BuildIt!
//
//  Created by Srihari Mohan on 7/25/15.
//  Copyright (c) 2015 Srihari Mohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var currentProject: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var bookmarksButton: UIBarButtonItem!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailFromHome" {
            let detailVC = segue.destinationViewController as! DetailViewController
            let query = (self.textField.text as String).lowercaseString
            
            if query.rangeOfString("camera") != nil || query.rangeOfString("pen") != nil || query.rangeOfString("prosthetic hand") != nil {
                let tempArray = Project.demoSet
                for proj in tempArray {
                    if query.rangeOfString(proj.name.lowercaseString) != nil {
                        let data = proj
                        detailVC.project = data
                        break;
                    }
                }
            }
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "showDetailFromHome" {
            let query = (self.textField.text as String).lowercaseString
            if !query.isEmpty {
                if (query.rangeOfString("camera") != nil || query.rangeOfString("pen") != nil || query.rangeOfString("prosthetic hand") != nil) {
                        return true;
                } else {
                    //add alert
                    let alertVC = UIAlertController(title: "\(self.textField.text) is not in your Project Catalog", message: "Try another design", preferredStyle: .Alert)
                    let alert_action = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
                    alertVC.addAction(alert_action)
                    self.presentViewController(alertVC, animated: true, completion: nil)
                    return false;
                }
            }
        }
        return false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.textField.delegate = self
        
        //configure profile image
        self.profileImage.image = UIImage(named: "ProfileImage")
        self.profileImage.layer.cornerRadius = 10
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.borderWidth = 2
        self.profileImage.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.coverImage.image = UIImage(named: "CoverImage2")
        
        self.currentProject.layer.cornerRadius = 10
        self.currentProject.clipsToBounds = true
        self.currentProject.layer.borderWidth = 2.5
        self.currentProject.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "dismissProfile")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let current_workspace_project = (UIApplication.sharedApplication().delegate as! AppDelegate).workspaceProject
        if current_workspace_project != nil {
            self.currentProject.image = current_workspace_project.baseImage
        } else {
            self.currentProject.image = Project.demoSet[0].baseImage
        }
        
        self.bookmarksButton.enabled = true
    }
    
    @IBAction func pickAnImageFromPhotoLibrary(sender: UIBarButtonItem) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func query(sender: UIButton) {
        //Segue in storyboard
        //shouldPerformSegueWithIdentifier not called otherwise
    }
    
    @IBAction func share(sender: UIBarButtonItem) {
        let image = UIImage()
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.presentViewController(activityVC, animated: true, completion: nil)
    }

    func dismissProfile() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true;
    }
}

