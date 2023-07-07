//
//  PolarisConfig.swift
//  Polaris
//
//  Created by Choshim.Wei on 2023/7/7.
//

import Foundation
import Moya

public class PolarisConfig {
    
    public static let `default` = PolarisConfig()
    
    /// 请求响应超时
    public var timeoutInterval: TimeInterval = 15.0
    
    /// 是否开启Cookies
    public var httpShouldHandleCookies: Bool = false
    
    /// 是否开启日志
    public var verbose: Bool = false
    
    /// 缓存目录
    public var cachedDir: String = "com.polaris.cache"
    
    /// 插件容器
    public var pluings: [PluginType] = []
}
