//
//  UserStatsViewController.swift
//  Banshee-Client
//
//  Created by Evan Lavertu on 11/29/20.
//
// Description: This file is responsible for displaying User Stats.

import UIKit

//class UserStatsViewController: UIViewController, UserManagerDelegate {
class UserStatsViewController: UIViewController {
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    //var userManager = UserManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userManager.delegate = self
    }
    
//    func didUpdateUser(user: UserModel) {
//        print(user.userId)
//        userIdLabel.text = "User ID: " + user.userId
//    }

//    @IBAction func updateButtonPressed(_ sender: UIButton) {
//        userManager.fetchUser()
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
