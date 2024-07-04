//
//  CharactersRepository.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import Foundation
import Combine

protocol CharacterListRepository {
    func get() -> AnyPublisher <Characters, BaseError>
    func getBy(name: String) -> AnyPublisher <Characters, BaseError>
}

struct CharacterListRepositoryImpl: CharacterListRepository {
    // MARK: - Properties
    private let charactersDataSource: CharactersDataSource

    init(charactersDataSource: CharactersDataSource) {
        self.charactersDataSource = charactersDataSource
    }
    
    // MARK: - Public Method -
    func get() -> AnyPublisher<Characters, BaseError> {
        charactersDataSource.get()
            .map { $0.characters }
            .eraseToAnyPublisher()
    }
    
    func getBy(name: String) -> AnyPublisher <Characters, BaseError> {
        charactersDataSource.search(by: name)
            .map { $0.characters }
            .eraseToAnyPublisher()
    }
}
