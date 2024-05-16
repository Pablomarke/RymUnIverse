//
//  DetailUseCase.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

protocol DetailUseCase {
    func getDetail(relativePath: String) -> AnyPublisher<Episode, BaseError>
}

struct DetailUseCaseImpl: DetailUseCase {
    private let detailRepository: DetailRepository
    
    init(detailRepository: DetailRepository) {
        self.detailRepository = detailRepository
    }
    
    func getDetail(relativePath: String) -> AnyPublisher<Episode, BaseError> {
        detailRepository.get(relativePath: relativePath)
    }
}
