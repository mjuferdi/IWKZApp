//
//  DetailMasjidViewController.swift
//  IWKZApp
//
//  Created by Mario Muhammad on 24.07.18.
//  Copyright © 2018 Mario Muhammad. All rights reserved.
//

import UIKit
import MapKit

class DetailMasjidViewController: UIViewController {
    
    var nameData: String!
    var addressData: String!
    var latitude = 0.0
    var longitude = 0.0

    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailAddress: UILabel!
    @IBOutlet weak var detailMapView: MKMapView!
    @IBOutlet weak var directionButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailName.text = nameData
        detailAddress.text = addressData
        
        let span = MKCoordinateSpanMake(0.005, 0.005)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: span)
        detailMapView.setRegion(region, animated: true)
        
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let pinAnn = MKPointAnnotation()
        pinAnn.coordinate = pinLocation
        pinAnn.title = detailName.text
        pinAnn.subtitle = detailAddress.text
        
        self.detailMapView.addAnnotation(pinAnn)
        
        directionButton.layer.cornerRadius = 5

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func directionTapped(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
