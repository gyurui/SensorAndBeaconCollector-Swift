//
//  ViewController.swift
//  SensorAndBeaconDataCollector-Swift
//
//  Created by Trum Gyorgy on 13/12/15.
//  Copyright © 2015 Trum Gyorgy. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var accelerationXUILabel: UILabel!
    @IBOutlet weak var accelerationYUILabel: UILabel!
    @IBOutlet weak var accelerationZUILabel: UILabel!
    
    @IBOutlet weak var btnStopAccelerometerUIButton: UIButton!
    
    var cbCentralManager : CMMotionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cbCentralManager.accelerometerUpdateInterval = 0.05

        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "getValues", userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        cbCentralManager.startAccelerometerUpdates()
    }
    
    override func viewWillDisappear(animated: Bool) {
        cbCentralManager.stopAccelerometerUpdates()
    }
    
    @IBAction func pushStopAccelerometerButton(sender: AnyObject) {
        cbCentralManager.stopAccelerometerUpdates()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getValues()
    {
        accelerationXUILabel.text = "X:\(round(<#T##Double#>)(cbCentralManager.accelerometerData?.acceleration.x)!)"
        accelerationYUILabel.text = "Y:\((cbCentralManager.accelerometerData?.acceleration.y)!)"
        accelerationZUILabel.text = "Z:\((cbCentralManager.accelerometerData?.acceleration.z)!)"
    }

}

