//
//  CharactersEnpoint.swift
//  RyMUnIverse
//
//  Created by Oscar Canton on 15/5/24.
//

import Foundation

enum CharactersEndpoint: APIEndpoint {
    case list
    case search(query: String)

    var baseURL: URL {
        URL(string: "https://rickandmortyapi.com/api/")!
    }

    var path: String {
        switch self {
        case .list:
            return "character/"
        case .search(let query):
            return "character/?name=\(query)"
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
