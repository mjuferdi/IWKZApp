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

    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailAddress: UILabel!
    @IBOutlet weak var detailMapView: MKMapView!
    @IBOutlet weak var directionButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailName.text = nameData
        detailAddress.text = addressData
        
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
