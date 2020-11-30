//
//  ViewController.swift
//  Banshee-Client
//
//  Created by Evan Lavertu on 11/29/20.
//
// Description: This file is the starting point for the app

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var callAPI: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let viewController = storyboard?.instantiateViewController(identifier: "userStatsViewController") as? UserStatsViewController else {
            return
        }
        present(viewController, animated: true)
    }
    
}

