//
//  CarSelectionViewController.swift
//  SmartEV_V2
//
//  Created by Sean Powers on 10/4/16.
//  Copyright © 2016 Sean Powers. All rights reserved.
//

import UIKit

class CarSelectionViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var CarImageView: UIImageView!
    @IBOutlet weak var LeftArrow: UIImageView!
    @IBOutlet weak var RightArrow: UIImageView!
    @IBOutlet weak var CarNameLabel: UILabel!
    @IBOutlet weak var ConfirmSelectButton: UIButton!
    
    // MARK: Properties
    // array of available cars
    var CarNames: [String] = [
        "Leaf",
        "TeslaM3",
        "Volt"
    ]
    
    // index for current showing car image
    var carIndex = 0
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initial first car
        updateCurrentCar()
        
        // set right select image tappable
        let rightTapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(CarSelectionViewController.rightArrowTapped(_:)))
        RightArrow.userInteractionEnabled = true
        RightArrow.addGestureRecognizer(rightTapGestureRecognizer)
        
        // set left select image tappable
        let leftTapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(CarSelectionViewController.leftArrowTapped(_:)))
        LeftArrow.userInteractionEnabled = true
        LeftArrow.addGestureRecognizer(leftTapGestureRecognizer)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    // MARK: Actions
    @IBAction func ConfirmSelection(sender: AnyObject) {
        print("Car Selected!")
        let launched = NSUserDefaults.standardUserDefaults().boolForKey("launched")
        if !launched {
            //proceed to set battery
            print("Time for battery");
            self.performSegueWithIdentifier("SetInitialBattery", sender:self)
        }
        else{
            //for now just go back
            self.performSegueWithIdentifier("ReturnToLaunch", sender:self)
        }
    }
    
    func rightArrowTapped(img: AnyObject){
        if (carIndex < CarNames.count - 1) {
            carIndex = carIndex + 1
            updateCurrentCar()
        }
        else{
            carIndex = 0
            updateCurrentCar()
        }
    }
    
    func leftArrowTapped(img: AnyObject){
        if (carIndex > 0) {
            carIndex = carIndex - 1
            updateCurrentCar()
        }
        else{
            carIndex = CarNames.count - 1
            updateCurrentCar()
        }
    }
    
    func updateCurrentCar() {
        CarImageView.image = UIImage(named: CarNames[carIndex])
        CarImageView.frame = CGRectMake(0,0,300,200)
        CarNameLabel.text = CarNames[carIndex]
    }
}

