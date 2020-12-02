//
//  UserManager.swift
//  Banshee-Client
//
//  Created by Evan Lavertu on 11/29/20.
//
// Description: This file is responsible for communicating with the server @ /api/user

import Foundation

protocol UserManagerDelegate {
    func didUpdateUser(_ userManager: UserManager, user: UserModel)
    func didFailWithError(error: Error)
}

struct UserManager {
    
    let userAPI = "http://localhost:8080/api/user/"
    var delegate: UserManagerDelegate?
    
    func fetchUser(_ userId: String) {
        let urlString = "\(userAPI)/userId/\(userId)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task with trailing closure
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let user = self.parseJSON(safeData) {
                        self.delegate?.didUpdateUser(self, user: user)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ userData: Data) -> UserModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(UserData.self, from: userData)
            
            let userId = decodedData.userId
            let username = decodedData.username
            let firstName = decodedData.firstName
            let lastName = decodedData.lastName
            let emailAddress = decodedData.emailAddress
            let wins = decodedData.wins
            let losses = decodedData.losses
            let gamesPlayed = decodedData.gamesPlayed
            let createDate = decodedData.createDate
            let updateDate = decodedData.updateDate
            
            let user = UserModel(userId: userId, username: username, firstName: firstName, lastName: lastName, emailAddress: emailAddress, wins: wins, losses: losses, gamesPlayed: gamesPlayed, createDate: createDate, updateDate: updateDate)
            
            return user;
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
