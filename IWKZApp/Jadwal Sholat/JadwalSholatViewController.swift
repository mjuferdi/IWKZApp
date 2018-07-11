//
//  JadwalSholatViewController.swift
//  IWKZApp
//
//  Created by Mario Muhammad on 04.07.18.
//  Copyright © 2018 Mario Muhammad. All rights reserved.
//

import UIKit

class JadwalSholatViewController: UIViewController {
    
    @IBOutlet weak var tanggalLabel: UILabel!
    @IBOutlet weak var subuhLabel: UILabel!
    @IBOutlet weak var dzuhurLabel: UILabel!
    @IBOutlet weak var asharLabel: UILabel!
    @IBOutlet weak var magribLabel: UILabel!
    @IBOutlet weak var isyaLabel: UILabel!
    
    
    var jadwal = Jadwal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JadwalSholat().getJadwal { (jadwal) in
            self.jadwal = jadwal
            self.tanggalLabel.text = self.jadwal.date
            self.subuhLabel.text = self.jadwal.subuh
            self.dzuhurLabel.text = self.jadwal.dzuhur
            self.asharLabel.text = self.jadwal.ashar
            self.magribLabel.text = self.jadwal.magrib
            self.isyaLabel.text = self.jadwal.isya
        }
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
}
