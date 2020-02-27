//
//  Serivce.swift
//  Networking
//
//  Created by Abhiney Natarajan on 2020-02-26.
//  Copyright © 2020 Abhiney Natarajan. All rights reserved.
//

import Foundation


enum ServiceMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var method: ServiceMethod { get }
}

extension Service {
    
    private var url: URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        switch method {
        case .get:
            // add query items to url
            if let parameters = parameters as? [String: String] {
                urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
            }
        default:
            break
        }
        return urlComponents?.url
    }
    
    private var httpBody: Data? {
        switch method {
        case .post:
            guard let parameters = parameters as? [String: String] else {
                fatalError("parameters for GET http method must conform to [String: String]")
            }
            if let queryParams = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) {
                return queryParams
            }
        default:
            break
        }
        return nil
    }
    
    public var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError("URL could not be built")
        }
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        if let body = httpBody {
            request.httpBody = body
        }
        

        return request
    }
}
