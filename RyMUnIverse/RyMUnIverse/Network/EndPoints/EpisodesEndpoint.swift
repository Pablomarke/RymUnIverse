//
//  EpisodesEndpoint.swift
//  RyMUnIverse
//
//  Created by Oscar Canton on 16/5/24.
//

import Foundation

enum EpisodesEndpoint: APIEndpoint {
    case episode(path: String)

    var baseURL: URL {
        URL(string: "https://rickandmortyapi.com/api/")!
    }

    var path: String {
        switch self {
            case .episode(let path):
            return "episode/\(path.components(separatedBy: "/").last ?? "")"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var header: [String: String] {
        return [:]
    }

    var body: Data? {
        return nil
    }
}
