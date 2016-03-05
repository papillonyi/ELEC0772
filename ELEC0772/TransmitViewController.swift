//
//  SecondViewController.swift
//  ELEC0772
//
//  Created by Andy on 4/03/2016.
//  Copyright © 2016 Andy. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class TransmitViewController: UIViewController {
  @IBOutlet weak var transmitUUIDLabel: UILabel!
  @IBOutlet weak var transmitMajorLabel: UILabel!
  @IBOutlet weak var transmitMinorLabel: UILabel!
  @IBOutlet weak var transmitIdentifierLabel: UILabel!
  @IBOutlet weak var transmitStatusLabel: UILabel!
  
  let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "1B98B576-0147-4E01-99F7-F2419E42EB77")!, major: 1, minor: 1, identifier: "CY")
  var beaconPeripheralData = [String : AnyObject]()
  var peripheralManager: CBPeripheralManager?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setTransmitLabels()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func startButton() {
    
    startTransmit()
  }
  
  @IBAction func stopButton() {
    stopTransmit()
  }
  
  func startTransmit() {
    peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
    beaconPeripheralData = beaconRegion.peripheralDataWithMeasuredPower(nil) as! [String : AnyObject]


    transmitStatusLabel.text = "Tracking"
    
  }
  
  func stopTransmit() {
    transmitStatusLabel.text = ""
  
  }
  
  func setTransmitLabels() {
    transmitUUIDLabel.text = beaconRegion.proximityUUID.UUIDString
    transmitMajorLabel.text = beaconRegion.major?.description
    transmitMinorLabel.text = beaconRegion.minor?.description
    transmitIdentifierLabel.text = beaconRegion.identifier
    
  }


}

extension TransmitViewController: CBPeripheralManagerDelegate {
  func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager, error: NSError?) {
    <#code#>
  }
  
  func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager) {
    print("hehehe UpdateState")
    if (peripheral.state == CBPeripheralManagerState.PoweredOn) {
      print("Powered On")
      peripheralManager?.startAdvertising(beaconPeripheralData)
      print("Started advertising")
    } else if (peripheral.state == CBPeripheralManagerState.PoweredOff) {
      print("Powered Off")
      peripheralManager?.stopAdvertising()
    }
  }
}

