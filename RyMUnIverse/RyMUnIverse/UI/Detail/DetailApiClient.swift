//
//  DetailApiClient.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

protocol DetailApiClient {
    func get() -> AnyPublisher<Character, BaseError>
}

final class DetailApiClientImpl: BaseApiClient,
                                 DetailApiClient {
    
    
    func get() -> AnyPublisher<Character, BaseError> {
        return getModelByAPI(relativePath: "",
                             type: Character.self)
    }
}
