//
//  TrackDataView.swift
//  ELEC0772
//
//  Created by Andy on 11/03/2016.
//  Copyright © 2016 Andy. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import CoreBluetooth

protocol TrackDataViewControllerDelegate: class {
  func getRssiData(controller: TrackDataViewController)
  
}

class TrackDataViewController: UITableViewController {
  var rssiData = [String]()
  var rssiData1 = "11.11"
  var rssidata2 = "22.22"
  weak var delegate: TrackDataViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate?.getRssiData(self)
    rssiData.append(rssiData1)
    rssiData.append(rssidata2)
  }
  

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return rssiData.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier( "CellItem", forIndexPath: indexPath)
    let label = cell.viewWithTag(10000) as! UILabel
    label.text = rssiData[indexPath.row]

    return cell
  }
  
  
  
}

  