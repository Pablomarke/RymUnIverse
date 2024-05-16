//
//  CharactersApiClient.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 25/4/24.
//

import Foundation
import Combine

protocol CharactersDataSource {
    func get() -> AnyPublisher <AllCharacters, BaseError>
    func search(by name: String) -> AnyPublisher <AllCharacters, BaseError>
}

struct CharactersDatasourceImpl: CharactersDataSource {
    private let apiClient: URLSessionAPIClient
    private let decoder: JSONDecoder

    init(apiClient: URLSessionAPIClient, decoder: JSONDecoder = JSONDecoder()) {
        self.apiClient = apiClient
        self.decoder = decoder
    }

    func get() -> AnyPublisher<AllCharacters, BaseError> {
        apiClient.request(endpoint: CharactersEndpoint.list)
            .tryMap({ (data, httpResponse) -> Data in
                guard httpResponse.isSuccess else {
                    throw BaseError.customError(statusCode: httpResponse.statusCode,
                                                message: "Something has gone wrong. Please try again later")
                }

                guard !httpResponse.httpNoContent else {
                    throw BaseError.noContent
                }

                return data
            })
            .decode(type: AllCharacters.self, decoder: decoder)
            .mapError({ error -> BaseError in
                guard let error = error as? BaseError else {
                    return BaseError.decodingError
                }

                return error
            })
            .eraseToAnyPublisher()
    }
    
    func search(by name: String) -> AnyPublisher<AllCharacters, BaseError> {
        apiClient.request(endpoint: CharactersEndpoint.search(query: name))
            .tryMap({ (data, httpResponse) -> Data in
                guard httpResponse.isSuccess else {
                    throw BaseError.customError(statusCode: httpResponse.statusCode,
                                                message: "Something has gone wrong. Please try again later")
                }

                guard !httpResponse.httpNoContent else {
                    throw BaseError.noContent
                }

                return data
            })
            .decode(type: AllCharacters.self, decoder: JSONDecoder())
            .mapError({ error -> BaseError in
                guard let error = error as? BaseError else {
                    return BaseError.decodingError
                }

                return error
            })
            .eraseToAnyPublisher()
    }
}
