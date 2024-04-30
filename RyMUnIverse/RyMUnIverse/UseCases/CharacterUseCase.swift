//
//  CharacterUseCase.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

protocol CharacterUseCase {
    func get() -> AnyPublisher<Characters, BaseError>
    func getBy(name: String) -> AnyPublisher<Characters, BaseError>
}

struct CharacterUseCaseImpl: CharacterUseCase {
    private let characterRepository: CharactersRepository
    
    init(characterRepository: CharactersRepository = CharacterRepositoryImpl()) {
        self.characterRepository = characterRepository
    }
    
    func get() -> AnyPublisher<Characters, BaseError> {
        characterRepository.get()
    }
    
    func getBy(name: String) -> AnyPublisher<Characters, BaseError> {
        characterRepository.getBy(name: name)
    }
}
