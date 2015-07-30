//
//  Project.swift
//  BuildIt!
//
//  Created by Srihari Mohan on 7/25/15.
//  Copyright (c) 2015 Srihari Mohan. All rights reserved.
//

import Foundation
import UIKit

struct Project {
    var baseImage: UIImage
    var name: String
    var tableDesc: String
    var description: String
    var associatedImages: [UIImage]
    
    static let ImageKey = "ImageKey"
    static let NameKey = "NameKey"
    static let TableDescKey = "TableDescKey"
    static let DescKey = "DescKey"
    static let AssocKey = "AssocKey"
    
    init(dictionary: [String : AnyObject]) {
        self.baseImage = dictionary[Project.ImageKey]! as! UIImage
        self.name = dictionary[Project.NameKey]! as! String
        self.tableDesc = dictionary[Project.TableDescKey]! as! String
        self.description = dictionary[Project.DescKey]! as! String
        self.associatedImages = dictionary[Project.AssocKey]! as! [UIImage]
    }
}

extension Project {
    static var demoSet: [Project] {
        var projArray = [Project]()
        for d in Project.localProjectData() {
            projArray.append(Project(dictionary: d))
        }
        
        return projArray;
    }
    
    static func localProjectData() -> [[String : AnyObject]] {
        var demoDictionary: [[String: AnyObject]]
        demoDictionary = [
            [Project.ImageKey : UIImage(named: "base_camera")!, Project.NameKey : "Camera", Project.TableDescKey : "A 3D Printable Camera", Project.DescKey : "Photography has transformed how people concieve the world. With the invention of the camera, we can now see things that are many miles -- and years -- away. The technology that makes this possible is fairly simple! A still camera is made of 3 basic elements: an optical (the lens), a chemical (film), and a mechanical (camera body). As we'll see, the trick to building a camera is combining and calibrating these elements in such a way as to record a clear image.",  Project.AssocKey : [UIImage(named: "Camera_subimage_1")!, UIImage(named: "Camera_subimage_2")!, UIImage(named: "Camera_subimage_3")!, UIImage(named: "Camera_subimage_4")!, UIImage(named: "Camera_subimage_5")!, UIImage(named: "Camera_subimage_6")!, UIImage(named: "Camera_subimage_7")!, UIImage(named: "Camera_subimage_8")!, UIImage(named: "Camera_subimage_9")!, UIImage(named: "Camera_subimage_10")!]],
                [Project.ImageKey : UIImage(named: "base_pen")!, Project.NameKey : "Pen", Project.TableDescKey : "A 3D printable pen", Project.DescKey : "In this electronic age with modern communications tools, such as e-mails and cell-phones, there is still no substitute for the good ol’ paper and pen. The key to the widely used ballpoint pen is the ball, which rotates easily and rolls out the ink as it is incessantly fed from the ink reservoir. This ink reservoir is typically a narrow plastic tube filled with ink. The miniature ball is held in a socket, and the back of the ball is visible so it can pick up ink from the reservoir by gravity. The ink is either plant-based (ex. wood oils, rosin, or linseed), which dries by oxidation and saturation, or solvent-based (ex. kerosene), which dries through evaporation. Black, the standard ink color, is derived from an organic pigment, carbon. Colored pigments are inorganic compounds of chromium (yellow, green, and orange), cadmium (red and yellow), molybdenum (orange), and iron (blue). In terms of the ballpoint pen ink, the ink is very concentrated and quick-drying. It is dense so that it doesn't leak out of the reservoir, but thin enough that it reacts to gravity. This is the reason why a ballpoint pen cannot write upside-down -- gravity pulls the ink onto the ball!",  Project.AssocKey : [UIImage(named: "Pen_subimage_1")!, UIImage(named: "Pen_subimage_2")!, UIImage(named: "Pen_subimage_3")!, UIImage(named: "Pen_subimage_4")!, UIImage(named: "Pen_subimage_5")!]],
                [Project.ImageKey : UIImage(named: "base_prosthetic")!, Project.NameKey : "Prosthetic Hand", Project.TableDescKey : "A 3D printable prosthetic hand", Project.DescKey : "The human body is a significant piece of biological machinery, and your limbs are no exception. Prosthetic limbs are extremely valuable to amputees because prosthesis can help restore some of the capabilities lost with the amputated limb. The pylon is the inner skeleton of the prosthetic limb. It provides basic support and is composed of light carbon-fiber. The pylons are sometimes enclosed by a cover, typically made from a foam-like material and colored to match the patient’s skin tone. The socket is the portion of the prosthetic device that interfaces with the patient's residual limb. Because the socket transmits forces from the prosthetic limb to the patient's body, it must be meticulously fitted to the residual limb to ensure that it doesn't cause irritation or damage to the skin or underlying tissues. A soft liner is typically located within the inside of the socket, and a patient might also wear a layer of one or more prosthetic socks to achieve a more snug fit. A recent advancement controls prosthetic limb using a mechanism by listening to muscles remaining in the residual limb that the patient can still contract. Because muscles generate small electrical signals when they contract, electrodes placed on the surface of the skin can measure muscle movements, a process called myoelectric. Although no buttons are physically pushed by the muscles in this case, their contractions are detected by the electrodes and then used to control the prosthetic limb!",  Project.AssocKey : [UIImage(named: "Prosthetic Hand_subimage_1")!, UIImage(named: "Prosthetic Hand_subimage_2")!, UIImage(named: "Prosthetic Hand_subimage_3")!, UIImage(named: "Prosthetic Hand_subimage_4")!, UIImage(named: "Prosthetic Hand_subimage_5")!, UIImage(named: "Prosthetic Hand_subimage_6")!, UIImage(named: "Prosthetic Hand_subimage_7")!, UIImage(named: "Prosthetic Hand_subimage_8")!, UIImage(named: "Prosthetic Hand_subimage_9")!, UIImage(named: "Prosthetic Hand_subimage_10")!, UIImage(named: "Prosthetic Hand_subimage_11")!, UIImage(named: "Prosthetic Hand_subimage_12")!, UIImage(named: "Prosthetic Hand_subimage_13")!, UIImage(named: "Prosthetic Hand_subimage_14")!, UIImage(named: "Prosthetic Hand_subimage_15")!, UIImage(named: "Prosthetic Hand_subimage_16")!]]
        ]
        return demoDictionary;
    }
}

