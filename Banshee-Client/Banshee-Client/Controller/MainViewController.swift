//
//  ViewController.swift
//  Banshee-Client
//
//  Created by Evan Lavertu on 11/29/20.
//
// Description: This file is the starting point for the app

import UIKit

class MainViewController: UIViewController, UserManagerDelegate {
    
    @IBOutlet weak var callAPI: UIButton!
    @IBOutlet weak var userIdLabel: UILabel!
    
    var userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userManager.delegate = self
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
//        guard let viewController = storyboard?.instantiateViewController(identifier: "userStatsViewController") as? UserStatsViewController else {
//            return
//        }
//        present(viewController, animated: true)
        userManager.fetchUser()
    }
    
    func didUpdateUser(_ userManager: UserManager, user: UserModel) {
        print(user.userId)
        DispatchQueue.main.async {
            self.userIdLabel.text = "User ID: " + user.userId
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

