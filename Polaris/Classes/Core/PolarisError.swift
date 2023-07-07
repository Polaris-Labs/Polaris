//
//  PolarisError.swift
//  Polaris
//
//  Created by Choshim.Wei on 2023/7/7.
//

import Foundation

public enum PolarisError: Error {
    /// 无网络连接
    case noConnected
    /// 其他错误 (错误码, 错误描述)
    case error(code: Int, message: String)
    
    /// 解析失败
    case decoder(message: String)
    
    public var statuCode: Int {
        switch self {
        case .noConnected:
            return -999
        case let .error(code, _):
            return code
        case .decoder:
            return -666
        }
    }
    
    public var message: String {
        switch self {
        case .noConnected:
            return "The current network is not connected."
        case let .error(_, message):
            return message
        case let .decoder(message):
            return message
        }
    }
}
