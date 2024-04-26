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
    func getAllCharacters(completion: @escaping (AllCharacters) -> Void) {
        let characterURl =  Endpoint.baseUrl + Endpoint.allCharacters
        guard let url = URL(string: characterURl) else {
            return
        }
        
        var urlRequest = URLRequest( url: url)
        urlRequest.httpMethod = HttpMethods.get
        
        URLSession.shared.dataTask(with: urlRequest) { data,response,error in
            DispatchQueue.main.async {
                guard let data,
                      (response as? HTTPURLResponse)?.statusCode == self.cstatusOk else {
                    return
                }
                
                guard error == nil else {
                    return
                }
                
                guard let allCharacters = try? JSONDecoder().decode(AllCharacters.self,
                                                                    from: data) else {
                    return
                }
                
                completion(allCharacters)
            }
        }.resume()
    }
    
    func getAllCharactersCombine<T: Decodable>(relativePath: String, type: T.Type = T.self) -> AnyPublisher<T, BaseError> {
        guard let url = URL(string: relativePath) else {
            return Fail(error: BaseError.failedURL).eraseToAnyPublisher()
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethods.get

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
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
/*
    func getAllCharactersCombine<T: Decodable> (relativePath: String,
                                                type: T.Type = T.self) -> AnyPublisher<T, BaseError> {
        
        guard let url = URL(string: relativePath) else {
            return
        }
        
        var urlRequest = URLRequest( url: url)
        urlRequest.httpMethod = HttpMethods.get
        
        return URLSession.shared.dataTask(with: urlRequest) { data,response,error in
            
            guard let data,
                  (response as? HTTPURLResponse)?.statusCode == self.cstatusOk else {
                return
            }
            
            guard error == nil else {
                return
            }
            
            guard let allCharacters = try? JSONDecoder().decode(AllCharacters.self,
                                                                from: data) else {
                return
            }
            
        } .eraseToAnyPublisher()
    }
}
    
    // MARK: - Public method
    func handler(error: Error?) -> BaseError? {

        if !self.isReachable { return .noInternetConnection }
        var baseError: BaseError?

        if error != nil {
            baseError = .handler
        }

        return baseError
    }

    func requestPublisher<T: Decodable> (relativePath: String?,
                                        method: HttpMethods = .get,
                                        parameters: Parameters? = nil,
                                        urlEncoding: ParameterEncoding = JSONEncoding.default,
                                        type: T.Type = T.self,
                                        base: URL? = URL(string: Base.mockMovilidad),
                                        customHeaders: HTTPHeaders? = nil) -> AnyPublisher<T, BaseError> {

        guard let url = base, let path = relativePath else {
            return Fail(error: .failedURL).eraseToAnyPublisher()
        }

        guard let urlAbsolute = url.appendingPathComponent(path).absoluteString.removingPercentEncoding else {
            return Fail(error: .noURl).eraseToAnyPublisher()
        }
        
        var headers = HTTPHeaders()
        return sesionManager.request(urlAbsolute,
                                     method: method,
                                     parameters: parameters,
                                     encoding: urlEncoding,
                                     headers: headers)
            .validate()
#if DEBUG
            .cURLDescription(on: .main, calling: { p in print(p) })
#endif
            .publishDecodable(type: T.self, emptyResponseCodes: [204])
            .tryMap({ response in
                 print(String(decoding: response.data!,
                              as: UTF8.self))
                switch response.result {
                case let .success(result):
                    return result
                case let .failure(error):
                    //   print(String(decoding: response.data!,
                    //               as: UTF8.self))
                  //  print(response.data)
                    print("-----------base-----------\(error)")
                    throw error
                }
            })
            .mapError({ [weak self] error in
                guard let self = self else {
                    return .generic
                }
                
                return self.handler(error: error) ?? .generic
            })
            .eraseToAnyPublisher()
    }
}
*/
