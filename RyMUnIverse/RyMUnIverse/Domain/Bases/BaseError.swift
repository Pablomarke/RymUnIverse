//
//  BaseError.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 26/4/24.
//

import Foundation

enum BaseError: Error {
    case generic
    case noInternetConnection
    case handler
    case failedURL
    case noURl
    case invalidResponse
    
    func description() -> String {
        switch self {
            case .generic:
                "Generic error"
            case .noInternetConnection:
                "No internet conection"
            case .handler:
                "Error in handler"
            case .failedURL:
                "Url Failed"
            case .noURl:
                "No URL"
            case .invalidResponse:
                "No valid response"
        }
    }
}
