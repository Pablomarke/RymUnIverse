//
//  CharacterRepository.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

protocol DetailRepository {
    func get() -> AnyPublisher <Character, BaseError>
}

struct DetailRepositoryImpl: DetailRepository {
    private let detailDataSource: DetailDataSource
    
    init(detailDataSource: DetailDataSource = DetailDataSourceImpl()) {
        self.detailDataSource = detailDataSource
    }
    
    func get() -> AnyPublisher<Character, BaseError> {
        detailDataSource.get()
            .eraseToAnyPublisher()
    }
}
