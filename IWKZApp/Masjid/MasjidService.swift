//
//  MasjidService.swift
//  IWKZApp
//
//  Created by Mario Muhammad on 11.07.18.
//  Copyright © 2018 Mario Muhammad. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

// Declare protocol
protocol UpdateDelegate {
    func didUpdate(sender: Masjid)
}

class Masjid {
    
    var delegate: UpdateDelegate?
    var masjids = [InfoMasjid]()
    var coor = [Double]()
    
    func getMasjid(lat: String, lon: String) {
        Alamofire.request("https://api.mjuan.info/masjid/10/\(lat)/\(lon)").responseJSON { (response) in
            print(response)
            self.masjids.removeAll()
            if let jsonArray = response.result.value as? [[String: Any]] {
                for json in jsonArray {
                    self.coor.removeAll()
                    guard let name = json["name"] as? String,
                        let address = json["address"] as? String,
                        let distance = json["distance"] as? String,
                        let coordinates = json["coordinates"] as? [Double]
                        
                        else {return}
                    
                    for coordinate in coordinates {
                        self.coor.append(coordinate)
                    }
                    let infos = InfoMasjid(name: name, address: address, distance: distance, coordinate: self.coor)
                    self.masjids.append(infos)
                }
                self.delegate?.didUpdate(sender: self)
                SVProgressHUD.dismiss()
            }
        }
    }
}

class InfoMasjid {
    var name = ""
    var address = ""
    var distance = ""
    var coordinate = [Double]()
    
    init(name: String, address: String, distance: String, coordinate: [Double]) {
        self.name = name
        self.address = address
        self.distance = distance
        self.coordinate = coordinate
    }
    
}
