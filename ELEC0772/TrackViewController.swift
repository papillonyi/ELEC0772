//
//  FirstViewController.swift
//  ELEC0772
//
//  Created by Andy on 4/03/2016.
//  Copyright © 2016 Andy. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation

class TrackViewController: UIViewController {
  @IBOutlet weak var trackUUIDLabel: UILabel!
  @IBOutlet weak var trackMajorLabel: UILabel!
  @IBOutlet weak var trackMinorLabel: UILabel!
  @IBOutlet weak var trackIdentifierLabel: UILabel!
  @IBOutlet weak var trackStatusLabel: UILabel!
  
  
  let locationManager = CLLocationManager()
  var beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "1B98B576-0147-4E01-99F7-F2419E42EB77")!, major: 1, minor: 1, identifier: "CY")
  
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.requestAlwaysAuthorization()
    print("hehehehehhe")
    }

    // Do any additional setup after loading the view, typically from a nib.

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func trackButton() {
    locationManager.delegate = self
    startRangingBeacons(beaconRegion)
    setTrackLabels(beaconRegion)
    trackStatusLabel.text = "Tracking"
  }
  @IBAction func stopTrack() {
    stopRangingBeacons(beaconRegion)
    trackStatusLabel.text = ""
  }
  
  func startRangingBeacons(region: CLBeaconRegion) {
    region.notifyEntryStateOnDisplay = true
    region.notifyOnEntry = true
    region.notifyOnExit = true
    locationManager.startRangingBeaconsInRegion(region)
    locationManager.startMonitoringForRegion(region)
  }
  
  func stopRangingBeacons(region: CLBeaconRegion) {
    locationManager.stopRangingBeaconsInRegion(region)
    locationManager.stopMonitoringForRegion(region)
  }
  
  func setTrackLabels(region: CLBeaconRegion) {
    trackUUIDLabel.text = region.proximityUUID.UUIDString
    trackMajorLabel.text = region.major?.description
    trackMinorLabel.text = region.minor?.description
    trackIdentifierLabel.text = region.identifier
  }


}

extension TrackViewController: CLLocationManagerDelegate {
  func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
    print(region)
    if beacon != nil {
      print(beacons)
    }
  }
  
  func locationManager(manager: CLLocationManager, rangingBeaconsDidFailForRegion region: CLBeaconRegion, withError error: NSError) {
    print("ranging Beacons fail \(error,description)")
  }
  
  func locationManager(manager: CLLocationManager, monitoringDidFailForRegion region: CLRegion?, withError error: NSError) {
    print("Failed monitoring region: \(error.description)")
  }
  
  func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    print("Location manager failed: \(error.description)")
  }
  
  
}


