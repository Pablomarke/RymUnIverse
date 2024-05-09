//
//  Character.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 26/4/24.
//

import Foundation
import SwiftUI

typealias Characters = [Character]

struct Character: Codable, Identifiable, Equatable, CellRepresentable {
    let id: Int
    let name: String
    let status: String
    let image: String
    let species: String
    let gender: String
    var type: String
    let episode: [String]
    let url: String
    var colorStatus: Color  {
        switch status {
            case "Alive":
                 .green
            case "Dead" :
                     .red
            default:
                    .gray
        }
    }
}
