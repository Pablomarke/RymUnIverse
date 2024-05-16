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
    case customError(statusCode: Int, message: String)
    case noURl
    case invalidResponse
    case decodingError
    case noContent

    func description() -> String {
        switch self {
            case .generic:
                "Generic error"
            case .noInternetConnection:
                "No internet conection"
            case .handler:
                "Error in handler"
            case .customError(let statusCode, let message):
                "Url Failed with \(statusCode): \(message)"
            case .noURl:
                "No URL"
            case .invalidResponse:
                "No valid response"
        case .decodingError:
            "Error in decoding"
        case .noContent:
            "No content"
        }
    }
}
