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
    
    @IBOutlet weak var inProgressLabel: UILabel!
    
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

    @IBAction func getGameButtonPressed(_ sender: UIButton) {
        gameManager.fetchGame("79c767f4-a440-477e-8b77-57a4d6199dce")
    }
    
    @IBAction func getGamesButtonPressed(_ sender: UIButton) {
        gameManager.fetchGames("1742fd58-262d-4ae9-9563-a3f901e741a2")
    }
    
    func didUpdateGame(_ gameManager: GameManager, game: GameModel) {
        // Update page with new Game object
        print(game)
    }
    
    func didUpdateGames(_ gameManager: GameManager, games: [GameModel]) {
        print(games)
        DispatchQueue.main.async {
            self.inProgressLabel.text = "In Progress: " + String(games.count)
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
