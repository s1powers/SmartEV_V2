//
//  ViewController.swift
//  SmartEV_V2
//
//  Created by Sean Powers on 10/1/16.
//  Copyright © 2016 Sean Powers. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let launched = NSUserDefaults.standardUserDefaults().boolForKey("launched")
        if !launched {
            self.performSegueWithIdentifier("CarSelectModal", sender:self)
            
        }
        else{
            print("Already launched!");
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "launched")

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

