//
//  HomeDataManager.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import Foundation
import Combine

final class HomeDataManager {
    // MARK: - Properties
    private var apiClient: HomeApiClient
    
    init(apiClient: HomeApiClient) {
        self.apiClient = apiClient
    }
    
    // MARK: - Public Method -
    func createCharacters() -> AnyPublisher <AllCharacters, BaseError> {
        apiClient.getCharacters()
    }
}
