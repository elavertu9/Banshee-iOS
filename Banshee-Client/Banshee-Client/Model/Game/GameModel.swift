//
//  GameModel.swift
//  Banshee-Client
//
//  Created by Evan Lavertu on 11/30/20.
//

import Foundation

struct GameModel {
    let gameId: String
//    let gameBoard: GameBoard
    let finished: Bool
    let user1Color: String
    let user2Color: String
    let isForfeit: Bool
    let user1: UserData
    let user2: UserData
    let createDate: String
    let updateDate: String
}

//struct GameBoard {
//    let rows: Int
//    let cols: Int
//}
