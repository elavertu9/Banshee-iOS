//
//  AccountViewController.swift
//  Banshee-Client
//
//  Created by Evan Lavertu on 12/1/20.
//

import UIKit

class AccountViewController: UIViewController, UserManagerDelegate {

    // userId
    // username
    // firstName
    // lastName
    // emailAddress
    // wins
    // losses
    // gamesPlayed
    // date joined (createDate)
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userManager.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func refreshPressed(_ sender: UIButton) {
        userManager.fetchUser("1742fd58-262d-4ae9-9563-a3f901e741a2")
    }
    
    func didUpdateUser(_ userManager: UserManager, user: UserModel) {
        print(user.userId)
        DispatchQueue.main.async {
            self.idLabel.text = "ID: " + user.userId
            self.usernameLabel.text = "Username: " + user.username
            self.firstNameLabel.text = "First: " + user.firstName
            self.lastNameLabel.text = "Last: " + user.lastName
            self.emailLabel.text = "Email: " + user.emailAddress
        }
    }

    func didFailWithError(error: Error) {
        print(error)
    }
}
