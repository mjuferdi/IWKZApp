//
//  MasjidTableViewController.swift
//  IWKZApp
//
//  Created by Mario Muhammad on 11.07.18.
//  Copyright © 2018 Mario Muhammad. All rights reserved.
//

import UIKit
import CoreLocation
import SVProgressHUD

class MasjidTableViewController: UITableViewController, CLLocationManagerDelegate, UpdateDelegate {
    
    
    
    let locationManager = CLLocationManager()
    var latitude = ""
    var longitude = ""
    var masjid = Masjid()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        masjid.delegate = self
        // Declare instance variables here
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        //tableView.separatorStyle = .none
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        
    }
    
    // Function to used by protocol for update table 
    func didUpdate(sender: Masjid) {
        self.tableView.reloadData()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        SVProgressHUD.show()
        SVProgressHUD.setFadeInAnimationDuration(1.0)
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            //print("long: \(location.coordinate.longitude), lat: \(location.coordinate.latitude)")
            latitude = String(location.coordinate.latitude)
            longitude = String(location.coordinate.longitude)
            
            let deadline = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: deadline) {
                self.masjid.getMasjid(lat: self.latitude, lon: self.longitude)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alert = UIAlertController(title: "Not Found", message: "Your location is not found", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return masjid.masjids.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "masjidCell", for: indexPath) as? MasjidCell {
            let info = masjid.masjids[indexPath.row]
            cell.nameLabel.text = info.name
            cell.addressLabel.text = info.address
            cell.distanceLabel.text = info.distance
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    // Prepare segue for each detail selected row
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMasjid" {
            let dvc = segue.destination as! DetailMasjidViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                dvc.nameData = masjid.masjids[indexPath.row].name as String
                dvc.addressData = masjid.masjids[indexPath.row].address as String
                dvc.latitude = masjid.masjids[indexPath.row].coordinate[0] as Double
                dvc.longitude = masjid.masjids[indexPath.row].coordinate[1] as Double
            }
        }
    }
}

class MasjidCell : UITableViewCell {
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var backgroundCardView: UIView!

}
