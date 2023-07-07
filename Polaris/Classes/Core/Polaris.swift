//
//  Polaris.swift
//  Pods
//
//  Created by Choshim.Wei on 2023/7/7.
//

import Foundation
import Alamofire
import Moya


public class Polaris {
    
    public static let `default` = Polaris()
    
    /// 网络连接状态
    public var isConnected: Bool = true
    
    public let provider: MoyaProvider<MultiTarget>
    
    public init() {
        
        self.provider = MoyaProvider(
            endpointClosure: Self.endpointClosure(),
            requestClosure: Self.requestClosure()
        )
        
        startNetworkLinstening()
    }
    
    
    public func test() {
        print("[Polaris] -- Polaris Test")
    }
    
    
    // MARK: - 开启网络状态监听
    private func startNetworkLinstening() {
        NetworkReachabilityManager.default?.startListening(onUpdatePerforming: { [weak self] status in
            
            if PolarisConfig.default.verbose {
#if DEBUG
                print("[Polaris] -- network status changed \(status)")
#endif
            }
            
            guard let self = self else { return }
            switch status {
            case .reachable, .unknown:
                self.isConnected = true
            case .notReachable:
                self.isConnected = false
            }
        })
    }
    
    ///
    private class func endpointClosure() -> MoyaProvider<MultiTarget>.EndpointClosure {
        return { target -> Endpoint in
            /// 避免URL中的'?'被转义
            let url = target.baseURL.absoluteString + target.path
            if PolarisConfig.default.verbose {
                #if DEBUG
                print("[Polaris] -- URL: \(url)")
                print("[Polaris] -- Method: \(target.method)")
                print("[Polaris] -- Task: \(target.task)")
                print("[Polaris] -- Header: \(target.headers ?? [:])")
                #endif
            }
            return Endpoint(
                url: url,
                sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }
    }
    
    private class func requestClosure() -> MoyaProvider<MultiTarget>.RequestClosure {
        return { endpoint, closure in
            do {
                var request = try endpoint.urlRequest()
                request.timeoutInterval = PolarisConfig.default.timeoutInterval
                closure(.success(request))
            } catch MoyaError.requestMapping(let url) {
                closure(.failure(.requestMapping(url)))
            } catch MoyaError.parameterEncoding(let error) {
                closure(.failure(.parameterEncoding(error)))
            } catch {
                closure(.failure(.underlying(error, nil)))
            }
        }
    }
    
    deinit {
        NetworkReachabilityManager.default?.stopListening()
    }
}
