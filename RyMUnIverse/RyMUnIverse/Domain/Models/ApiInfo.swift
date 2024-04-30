//
//  ApiInfo.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 26/4/24.
//

import Foundation

struct ApiInfo: Codable, Equatable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
