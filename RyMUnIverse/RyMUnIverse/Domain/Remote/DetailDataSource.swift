//
//  DetailApiClient.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 30/4/24.
//

import Foundation
import Combine

protocol DetailDataSource {
    func getDetail(relativePath: String) -> AnyPublisher<Episode, BaseError>
}

struct DetailDataSourceImpl: DetailDataSource {
    private let apiClient: URLSessionAPIClient
    private let decoder: JSONDecoder

    init(apiClient: URLSessionAPIClient, decoder: JSONDecoder = JSONDecoder()) {
        self.apiClient = apiClient
        self.decoder = decoder
    }

    func getDetail(relativePath: String) -> AnyPublisher<Episode, BaseError> {
        apiClient.request(endpoint: EpisodesEndpoint.episode(path: relativePath))
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
            .decode(type: Episode.self, decoder: decoder)
            .mapError({ error -> BaseError in
                guard let error = error as? BaseError else {
                    return BaseError.decodingError
                }

                return error
            })
            .eraseToAnyPublisher()
    }
}
