//
//  CharactersRepository.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import Foundation
import Combine

protocol CharactersRepository {
    func get() -> AnyPublisher <Characters, BaseError>
    func getBy(name: String) -> AnyPublisher <Characters, BaseError>
}

struct CharacterRepositoryImpl: CharactersRepository {
    // MARK: - Properties
    private let characterDataSource: CharactersDataSource
    
    init(characterDataSource: CharactersDataSource = CharactersDataSourceImpl()) {
        self.characterDataSource = characterDataSource
    }
    
    // MARK: - Public Method -
    func get() -> AnyPublisher<Characters, BaseError> {
        characterDataSource.get()
            .map { $0.characters }
            .eraseToAnyPublisher()
    }
    
    func getBy(name: String) -> AnyPublisher <Characters, BaseError> {
        characterDataSource.getBy(name: name)
            .map { $0.characters }
            .eraseToAnyPublisher()
    }
}
