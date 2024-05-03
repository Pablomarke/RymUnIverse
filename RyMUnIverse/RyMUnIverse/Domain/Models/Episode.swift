//
//  Episode.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 2/5/24.
//

import Foundation

typealias Episodes = [Episode]

struct Episode: Codable, Equatable, Hashable {
    let name: String
    let episode: String
    let characters: [String]
    let url: String
    let air_date: String
}
