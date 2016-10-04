//
//  BatteryLevelViewController.swift
//  SmartEV_V2
//
//  Created by Sean Powers on 10/4/16.
//  Copyright © 2016 Sean Powers. All rights reserved.
//


import UIKit

class BatteryLevelViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var BatteryImage: UIImageView!
    
    @IBOutlet weak var BatterySlider: UISlider!
    @IBOutlet weak var BatteryPercentage: UILabel!
    @IBOutlet weak var ConfirmBatteryLevelButton: UIButton!
    // MARK: Properties

    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }

    // MARK: Actions
    @IBAction func ConfirmBatteryLevel(sender: AnyObject) {
        let launched = NSUserDefaults.standardUserDefaults().boolForKey("launched")
        if !launched {
            //called from first launch
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "launched")
            
            //return to main screen
            self.performSegueWithIdentifier("ReturnToLaunch", sender:self)
            print("Battery Level Set")
        }
        else{
            //for now just go back
            self.performSegueWithIdentifier("ReturnToLaunch", sender:self)
        }
    }
}
