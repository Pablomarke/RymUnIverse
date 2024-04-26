//
//  Character.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 26/4/24.
//

import Foundation

typealias Characters = [Character]

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let image: String
    let species: String
    let gender: String
    var type: String
    let episode: [String]
}
