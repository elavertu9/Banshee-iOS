//
//  GamesViewController.swift
//  Banshee-Client
//
//  Created by Evan Lavertu on 12/1/20.
//
//  Notes: Use this VC on the Games screen of the storyboard. Use one of the below methods to launch a game instance
//
//
//@IBAction func buttonPressed() {
//    let vc = UIViewController()
//    vc.view.backgroundColor = .red
//    navigationController?.pushViewController(vc, animated: true)
//}
    
// guard let viewController = storyboard?.instantiateViewController(identifier: "userStatsViewController") as? UserStatsViewController else {
//      return
// }
// present(viewController, animated: true)


import UIKit

class GamesViewController: UIViewController, GameManagerDelegate {
    
    var gameManager = GameManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gameManager.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func gameButtonPressed(_ sender: UIButton) {
        gameManager.fetchGame("79c767f4-a440-477e-8b77-57a4d6199dce")
    }
    
    func didUpdateGame(_ gameManager: GameManager, game: GameModel) {
        // Update page with new Game object
        print(game)
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
