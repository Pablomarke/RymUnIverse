//
//  HomeApiClient.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import Foundation
import Combine

final class HomeApiClient: BaseApiClient {
    // MARK: - Public methods -
    func getCharacters() -> AnyPublisher <AllCharacters, BaseError> {
        let url = Endpoint.baseUrl + Endpoint.allCharacters
        return getModelByAPI(relativePath: url,
                             type: AllCharacters.self)
    }
    
    func getCharacterBySearch(parameter: String) -> AnyPublisher <AllCharacters, BaseError> {
        let url = Endpoint.baseUrl + Endpoint.allCharacters
        return getModelWithParametersByAPI(relativePath: url,
                                           parameter: parameter,
                                           type: AllCharacters.self)
    }
}
