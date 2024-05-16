//
//  APIResponse.swift
//  RyMUnIverse
//
//  Created by Oscar Canton on 16/5/24.
//

import Foundation

extension HTTPURLResponse {
    var isSuccess: Bool {
        statusCode >= 200 && statusCode < 300
    }

    var isOk: Bool {
        statusCode == 200
    }

    var httpNoContent: Bool {
        statusCode == 204
    }
}
