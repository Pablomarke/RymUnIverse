//
//  DetailDataManager.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation

struct DetailDataManager {
    // MARK: - Properties
    private var apiClient: DetailApiClient
    
    init(apiClient: DetailApiClient) {
        self.apiClient = apiClient
    }
}
