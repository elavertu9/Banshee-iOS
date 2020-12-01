//
//  User.swift
//  Banshee-Client
//
//  Created by Evan Lavertu on 11/29/20.
//
// Description: This file is used to decode User objects from JSON

import Foundation

struct UserData : Decodable {
    let userId: String
    let username: String
    let firstName: String
    let lastName: String
    let emailAddress: String
    let wins: Int
    let losses: Int
    let gamesPlayed: Int
    let createDate: String
    let updateDate: String
//    let myPieces: MyPieces
}

//struct MyPieces : Decodable {
//
//}
