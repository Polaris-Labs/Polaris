//
//  JSONArrayEncoding.swift
//  Polaris
//
//  Created by Choshim.Wei on 2023/7/7.
//

import Alamofire

public struct JSONArrayEncoding: ParameterEncoding {
    
    static let `default` = JSONArrayEncoding()
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        guard let json = parameters?["dataArray"] else {
            return request
        }
        
        let data = try JSONSerialization.data(withJSONObject: json)
        if request.value(forHTTPHeaderField: "Content-Type") == nil {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        request.httpBody = data
        return request
    }
}
