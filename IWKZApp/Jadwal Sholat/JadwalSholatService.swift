//
//  JadwalSholatService.swift
//  IWKZApp
//
//  Created by Mario Muhammad on 04.07.18.
//  Copyright © 2018 Mario Muhammad. All rights reserved.
//

import Foundation
import Alamofire

class JadwalSholat {
    func getJadwal(returnJadwal : @escaping (Jadwal) -> Void) {
        Alamofire.request("https://api.mjuan.info/jadwalshalat/berlin").responseJSON { (response) in
            //print(response)
            // Parsing JSON
            if let json = response.result.value as? [String:Any] {
                guard let date = json["date"] as? String,
                let subuh = json["subuh"] as? String,
                let dzuhur = json["dzuhur"] as? String,
                let ashar = json["ashr"] as? String,
                let magrib = json["maghrib"] as? String,
                let isya = json["isya"] as? String
                    else {return}
                
                let jadwal = Jadwal()
                jadwal.date = date
                jadwal.subuh = subuh
                jadwal.dzuhur = dzuhur
                jadwal.ashar = ashar
                jadwal.magrib = magrib
                jadwal.isya = isya
                
                returnJadwal(jadwal)
            }
        }
    }
}


class Jadwal {
    var date = ""
    var subuh = ""
    var dzuhur = ""
    var ashar = ""
    var magrib = ""
    var isya = ""
}
