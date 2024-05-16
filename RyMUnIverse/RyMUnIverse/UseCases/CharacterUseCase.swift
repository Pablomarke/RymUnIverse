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
}

struct CharacterUseCaseImpl: CharacterUseCase {
    private let characterRepository: CharacterListRepository
    
    init(characterRepository: CharacterListRepository) {
        self.characterRepository = characterRepository
    }
    
    func get() -> AnyPublisher<Characters, BaseError> {
        characterRepository.get()
    }
}
