//
//  BaseApiClient.swift
//  RyMUnIverse
//
//  Created by Pablo Márquez Marín on 26/4/24.
//

import Foundation
import Combine

class BaseApiClient {
    private var isReachable: Bool = true
    private let cstatusOk = 200
    enum HttpMethods {
        static let get = "GET"
    }
    
    // MARK: Characters
    func getModelDataByUrl<T: Decodable>(relativePath: String, 
                                         type: T.Type = T.self) -> AnyPublisher<T, BaseError> {
        guard let url = URL(string: relativePath) else {
            return Fail(error: BaseError.failedURL).eraseToAnyPublisher()
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethods.get

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 
                        httpResponse.statusCode == self.cstatusOk else {
                    throw BaseError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                BaseError.generic
            }
            .eraseToAnyPublisher()
    }
}
