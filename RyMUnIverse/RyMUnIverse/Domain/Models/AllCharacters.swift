//
//  AllCharacters.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 26/4/24.
//

import Foundation

struct AllCharacters: Codable, Equatable {
    let characters: Characters
    let info: ApiInfo?
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
        case info
    }
}
