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
  
}

class TrackDataViewController: UITableViewController {
  var items = ["heheh","hahahah"]
  
  override func viewDidLoad() {
    dismissViewControllerAnimated(true, completion: nil)
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier( "CellItem", forIndexPath: indexPath)
    let label = cell.viewWithTag(10000) as! UILabel
    label.text = String(indexPath.row)

    return cell
  }
  
  @IBAction func addItem() {
      let newRowIndex = items.count
      let item = "I am a new row"
      items.append(item)
      let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
      let indexPaths = [indexPath]
      tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
  }
  
  
}

  