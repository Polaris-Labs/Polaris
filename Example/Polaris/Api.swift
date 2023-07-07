//
//  Api.swift
//  Polaris_Example
//
//  Created by Choshim.Wei on 2023/7/7.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import Moya

enum Api {
    case lyrical
}

extension Api: TargetType {
    var baseURL: URL {
        return URL(string: "https://open.saintic.com")!
    }
    
    var path: String {
        switch self {
        case .lyrical: return "/api/sentence/shuqing..json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .lyrical: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .lyrical:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
