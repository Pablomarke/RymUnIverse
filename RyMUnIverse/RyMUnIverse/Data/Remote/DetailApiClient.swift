//
//  DetailApiClient.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

protocol DetailApiClient {
    func getDetails(relativePath: String) -> AnyPublisher<Episode, BaseError>
}

final class DetailApiClientImpl: BaseApiClient,
                                 DetailApiClient {
    
    func getDetails(relativePath: String) -> AnyPublisher<Episode, BaseError> {
        return getModelByAPI(relativePath: relativePath,
                             type: Episode.self)
    }
}
