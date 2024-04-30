//
//  DetailUseCase.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

protocol DetailUseCase {
    func getDetail() -> AnyPublisher<Character, BaseError>
}

struct DetailUseCaseImpl: DetailUseCase {
    private let detailRepository: DetailRepository
    
    init(detailRepository: DetailRepository = DetailRepositoryImpl()) {
        self.detailRepository = detailRepository
    }
    
    func getDetail() -> AnyPublisher<Character, BaseError> {
        detailRepository.get()
    }
}
