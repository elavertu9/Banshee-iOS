//
//  GameManager.swift
//  Banshee-Client
//
//  Created by Evan Lavertu on 11/30/20.
//

import Foundation

protocol GameManagerDelegate {
    func didUpdateGame(_ gameManager: GameManager, game: GameModel)
    func didFailWithError(error: Error)
}

struct GameManager {
    
    let gameAPI = "http://localhost:8080/api/game/"
    var delegate: GameManagerDelegate?
    
    func fetchGame(_ gameId: String) {
        let urlString = "\(gameAPI)/gameId/\(gameId)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    
                }
                
                if let safeData = data {
                    if let game = self.parseJSON(safeData) {
                        self.delegate?.didUpdateGame(self, game: game)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ gameData: Data) -> GameModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(GameData.self, from: gameData)
            
            let gameId = decodedData.gameId
            let finished = decodedData.finished
            let user1Color = decodedData.user1Color
            let user2Color = decodedData.user2Color
            let isForfeit = decodedData.isForfeit
            let user1 = decodedData.user1
            let user2 = decodedData.user2
            let createDate = decodedData.createDate
            let updateDate = decodedData.updateDate
            
            let game = GameModel(gameId: gameId, finished: finished, user1Color: user1Color, user2Color: user2Color, isForfeit: isForfeit, user1: user1, user2: user2, createDate: createDate, updateDate: updateDate)
            
            return game;
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
