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
  @IBOutlet weak var UUIDLabel: UILabel!
  @IBOutlet weak var majorLabel: UILabel!
  @IBOutlet weak var minorLabel: UILabel!
  @IBOutlet weak var identifierLabel: UILabel!
  
  
  let locationManager = CLLocationManager()
  let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "1B98B576-0147-4E01-99F7-F2419E42EB77")!, major: 1, minor: 1, identifier: "CY")

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func trackButton() {
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    startRangingBeacons(beaconRegion)
    setLabels(beaconRegion)
  }
  
  func startRangingBeacons(region: CLBeaconRegion) {
    locationManager.startRangingBeaconsInRegion(region)
  }
  
  func setLabels(region: CLBeaconRegion) {
    UUIDLabel.text = region.proximityUUID.UUIDString
    majorLabel.text = region.major?.description
    minorLabel.text = region.minor?.description
    identifierLabel.text = region.identifier
  }


}

extension TrackViewController: CLLocationManagerDelegate {
  func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
    <#code#>
  }
}


