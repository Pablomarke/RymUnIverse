//
//  CellRepresentable.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 26/4/24.
//

import Foundation
import SwiftUI

protocol CellRepresentable {
    var name: String { get }
    var species: String { get }
    var image: String { get }
    var colorStatus: Color { get }
}
