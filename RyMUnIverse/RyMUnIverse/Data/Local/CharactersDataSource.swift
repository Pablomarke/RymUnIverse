//
//  CharactersDataSource.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

protocol CharactersDataSource {
    func get() -> AnyPublisher <AllCharacters, BaseError>
    func getBy(name: String) -> AnyPublisher<AllCharacters, BaseError>
}

struct CharactersDataSourceImpl: CharactersDataSource {
    private let characterApiClient: CharactersApiClient
    
    init(characterApiClient: CharactersApiClient = CharactersApiClientImpl()) {
        self.characterApiClient = characterApiClient
    }
    
    func get() -> AnyPublisher<AllCharacters, BaseError> {
        characterApiClient.get()
    }
    
    func getBy(name: String) -> AnyPublisher<AllCharacters, BaseError> {
        characterApiClient.getCharacterBySearch(parameter: name)
    }
}
