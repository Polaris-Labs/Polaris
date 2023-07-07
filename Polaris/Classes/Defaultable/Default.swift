//
//  Default.swift
//  Polaris
//
//  Created by Choshim.Wei on 2023/7/7.
//

import Foundation

 @propertyWrapper public struct Default<T: Defaultable> {
    
     public var wrappedValue: T.Value
     
     public init(wrappedValue: T.Value) {
         self.wrappedValue = wrappedValue
     }
}

extension Default: Codable {
   public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.Value.self)) ?? T.defaultValue
    }
}

extension KeyedDecodingContainer {
    func decode<T>(_ type: Default<T>.Type, forKey key: Key) throws -> Default<T> where T: Defaultable {
        /// 缺失Key的情况下, 提供默认值
        (try decodeIfPresent(type, forKey: key)) ?? Default(wrappedValue: T.defaultValue)
    }
}
