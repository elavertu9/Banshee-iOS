//
//  GameManager.swift
//  Banshee-Client
//
//  Created by Evan Lavertu on 11/30/20.
//

import Foundation

protocol GameManagerDelegate {
    func didUpdateGame(_ gameManager: GameManager, game: GameModel)
    func didUpdateGames(_ gameManager: GameManager, games: [GameModel])
    func didFailWithError(_ error: Error)
}

struct GameManager {
    
    let gameAPI = "http://localhost:8080/api/game"
    var delegate: GameManagerDelegate?
    
    func fetchGame(_ gameId: String) {
        let urlString = "\(gameAPI)/gameId/\(gameId)"
        performRequest(with: urlString)
    }
    
    func fetchGames(_ userId: String) {
        let urlString = "\(gameAPI)/userId/\(userId)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    
                    if urlString.contains("/userId") {
                        // handle array
                        print("All user games requested")
                        print(urlString)
                        
                        if let games = self.parseJSONArray(safeData) {
                            self.delegate?.didUpdateGames(self, games: games)
                        }
                    } else {
                        // handle single game object
                        print("Single game requested")
                        print(urlString)
                        
                        if let game = self.parseJSONObject(safeData) {
                            self.delegate?.didUpdateGame(self, game: game)
                        }
                    }
                    
                    
                }
            }
            task.resume()
        }
    }
    
    func parseJSONArray(_ gamesData: Data) -> [GameModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([GameData].self, from: gamesData)
            
            var games = [GameModel]()
            
            for game in decodedData {
                let currentGame = GameModel(gameId: game.gameId, finished: game.finished, user1Color: game.user1Color, user2Color: game.user2Color, isForfeit: game.isForfeit, user1: game.user1, user2: game.user2, createDate: game.createDate, updateDate: game.updateDate)
                games.append(currentGame)
            }
            
            return games
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
    func parseJSONObject(_ gameData: Data) -> GameModel? {
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
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
