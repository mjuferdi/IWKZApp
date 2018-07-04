//
//  ViewController.swift
//  IWKZApp
//
//  Created by Mario Muhammad on 02.07.18.
//  Copyright © 2018 Mario Muhammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jadwalButton: UIButton!
    @IBOutlet weak var masjidButton: UIButton!
    @IBOutlet weak var restaurantButton: UIButton!
    @IBOutlet weak var supermarketButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jadwalButton.titleLabel?.adjustsFontSizeToFitWidth = true
        masjidButton.titleLabel?.adjustsFontSizeToFitWidth = true
        restaurantButton.titleLabel?.adjustsFontSizeToFitWidth = true
        supermarketButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        jadwalButton.layer.cornerRadius = 5.0
        masjidButton.layer.cornerRadius = 5.0
        restaurantButton.layer.cornerRadius = 5.0
        supermarketButton.layer.cornerRadius = 5.0

    }

    @IBAction func jadwalTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
    }
    
    @IBAction func masjidTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 2
    }
    
    @IBAction func restaurantTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 3
    }
    @IBAction func supermarketTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 4
    }
    
    
}

