//
//  HomeDataManager.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import Foundation
import Combine

struct HomeDataManager {
    // MARK: - Properties
    private var apiClient: HomeApiClient
    
    init(apiClient: HomeApiClient) {
        self.apiClient = apiClient
    }
    
    // MARK: - Public Method -
    func createCharacters() -> AnyPublisher <AllCharacters, BaseError> {
        apiClient.getCharacters()
    }
    
    func getCharactersBySearch(parameter: String) -> AnyPublisher <AllCharacters, BaseError> {
        apiClient.getCharacterBySearch(parameter: parameter)
    }
}
