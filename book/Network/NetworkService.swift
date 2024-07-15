//
//  NetworkService.swift
//  book
//
//  Created by Daria on 08.07.2024.
//

import Combine
import Foundation

enum NetworkError: Error {
    
    case serializationFault(description: String)
    case networkError(Error)
    
}

protocol ResponseHandler {
    
    associatedtype Value
    
    func handleResponse(_ data: Data) -> AnyPublisher<Value, Error>
    
}

class NetworkService {
    
    func executeRequest<T: ResponseHandler>(withURL url: URL, responseHandler: T) -> AnyPublisher<T.Value, NetworkError> {
        executeRequest(withURL: url)
            .flatMap { data in
                responseHandler.handleResponse(data)
                    .mapError { error in
                        if let networkError = error as? NetworkError {
                            return networkError
                        } else {
                            return NetworkError.serializationFault(description: "Response handler error: \(error.localizedDescription)")
                        }
                    }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    private func executeRequest(withURL url: URL) -> AnyPublisher<Data, NetworkError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .mapError { NetworkError.networkError($0) }
            .eraseToAnyPublisher()
    }
    
}
