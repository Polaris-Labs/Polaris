//
//  Defaultable.swift
//  Polaris
//
//  Created by Choshim.Wei on 2023/7/7.
//

import Foundation

/// https://jierong.dev/2021/02/26/providing-default-value-for-decodable-property-by-property-wrapper.html
public protocol Defaultable {
    associatedtype Value: Codable
    
    static var defaultValue: Value { get }
}

extension Bool: Defaultable {
    public static var defaultValue: Bool = false
}

extension Int: Defaultable {
    public static var defaultValue: Int = 0
}

extension Int8: Defaultable {
    public static var defaultValue: Int8 = 0
}

extension Int16: Defaultable {
    public static var defaultValue: Int16 = 0
}

extension Int32: Defaultable {
    public static var defaultValue: Int32 = 0
}

extension Int64: Defaultable {
    public static var defaultValue: Int64 = 0
}

extension UInt: Defaultable {
    public static var defaultValue: UInt = 0
}

extension UInt8: Defaultable {
    public static var defaultValue: UInt8 = 0
}

extension UInt16: Defaultable {
    public static var defaultValue: UInt16 = 0
}

extension UInt32: Defaultable {
    public static var defaultValue: UInt32 = 0
}

extension UInt64: Defaultable {
    public static var defaultValue: UInt64 = 0
}

extension Float: Defaultable {
    public static var defaultValue: Float = 0
}

extension Double: Defaultable {
    public static var defaultValue: Double = 0
}

extension String: Defaultable {
    public static var defaultValue: String = ""
}

extension Date: Defaultable {
    public static var defaultValue: Date = Date(timeIntervalSinceReferenceDate: 0)
}

extension Data: Defaultable {
    public static var defaultValue: Data = Data()
}

extension Decimal: Defaultable {
    public static var defaultValue: Decimal = Decimal(0)
}
