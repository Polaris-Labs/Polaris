//
//  Polaris+TargetType.swift
//  Polaris
//
//  Created by Choshim.Wei on 2023/7/7.
//

import Foundation
import Moya

class CancelableNetwork: Cancellable {
    var isCancelled: Bool = true
    
    func cancel() {
        isCancelled = false
    }
}

extension TargetType {
    
    @discardableResult
    public func request(progressCallback: ((Double) -> Void)? = nil, completion: @escaping (Result<Response, PolarisError>) -> Void) -> Cancellable {
        if !Polaris.default.isConnected {
            completion(.failure(.noConnected))
            return CancelableNetwork()
        }
        
        return Polaris.default.provider.request(.target(self), progress: { progress in
            progressCallback?(progress.progress)
        }, completion: { result in
            switch result {
            case let .success(response):
                completion(.success(response))
            case let .failure(error):
                completion(.failure(.error(code: error.errorCode, message: error.localizedDescription)))
            }
        })
    }
    
    
    @discardableResult
    public func request<T: Codable>(_ type: T.Type, progressCallback: ((Double) -> Void)? = nil, completion: @escaping (Result<T, PolarisError>) -> Void) -> Cancellable {
        if !Polaris.default.isConnected {
            completion(.failure(.noConnected))
            return CancelableNetwork()
        }
        
        return Polaris.default.provider.request(.target(self), progress: { progress in
            progressCallback?(progress.progress)
        }, completion: { result in
            switch result {
            case let .success(response):
                do {
                    let model = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(model))
                } catch {
                    completion(.failure(.decoder(message: error.localizedDescription)))
                }
            case let .failure(error):
                completion(.failure(.error(code: error.errorCode, message: error.localizedDescription)))
            }
        })
    }
}
