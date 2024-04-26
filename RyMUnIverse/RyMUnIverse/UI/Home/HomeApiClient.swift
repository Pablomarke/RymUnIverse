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
        let url = "https://rickandmortyapi.com/api/character"
        return getAllCharactersCombine(relativePath: url,
                                       type: AllCharacters.self)
    }
}
