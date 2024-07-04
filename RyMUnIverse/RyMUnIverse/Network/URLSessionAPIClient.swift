//
//  APIResponse.swift
//  RyMUnIverse
//
//  Created by Oscar Canton on 15/5/24.
//

import Foundation
import Combine

protocol HTTPClient {
    associatedtype DataRequestPublisher = AnyPublisher<(Data, HTTPURLResponse), BaseError>

    func request(endpoint: APIEndpoint) -> DataRequestPublisher
}

protocol HTTPSession {
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
}

extension URLSession: HTTPSession { }


struct URLSessionAPIClient: HTTPClient {
    private let session: HTTPSession

    init(session: HTTPSession = URLSession.shared) {
        self.session = session
    }

    func request(endpoint: APIEndpoint) -> DataRequestPublisher {
        let url: URL = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request: URLRequest = .init(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        request.httpBody = endpoint.body
        endpoint.header.forEach({ request.addValue($0.value, forHTTPHeaderField: $0.key )})
        
        return session.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { (data, response) -> (Data, HTTPURLResponse) in
                guard let response = response as? HTTPURLResponse else {
                    throw BaseError.invalidResponse
                }

                guard (200...299).contains(response.statusCode) else {
                    throw BaseError.customError(statusCode: response.statusCode, 
                                                message: "Something has gone wrong. Please try again later")
                }

                return (data, response)
            }
            .mapError({ error -> BaseError in
                guard let error = error as? BaseError else {
                    return BaseError.generic
                }
                return error
            })
            .eraseToAnyPublisher()

    }
}
