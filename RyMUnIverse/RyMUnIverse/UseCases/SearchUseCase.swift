//
//  SearchUseCase.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

protocol SearchUseCase {
    func getBy(name: String) -> AnyPublisher<Characters, BaseError>
}

struct SearchUseCaseImpl: SearchUseCase {
    private let characterRepository: CharacterListRepository
    
    init(characterRepository: CharacterListRepository) {
        self.characterRepository = characterRepository
    }
    
    func getBy(name: String) -> AnyPublisher<Characters, BaseError> {
        characterRepository.getBy(name: name)
    }
}
