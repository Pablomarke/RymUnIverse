//
//  DetailDataManager.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

protocol DetailDataSource {
    func get(relativePath: String) -> AnyPublisher <Episode, BaseError>
}

struct DetailDataSourceImpl: DetailDataSource {
    private let detailApiClient: DetailApiClient
    
    init(detailApiClient: DetailApiClient = DetailApiClientImpl()) {
        self.detailApiClient = detailApiClient
    }
    
    func get(relativePath: String) -> AnyPublisher<Episode, BaseError> {
        detailApiClient.getDetails(relativePath: relativePath)
    }
}
