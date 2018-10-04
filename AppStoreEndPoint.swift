//
//  AppStoreEndPoint.swift
//  AppStoreContent
//
//  Created by Tharaka on 10/3/18.
//  Copyright © 2018 Tharaka. All rights reserved.
//


import Foundation

enum AppStoreEndPoint
{
    case search(term: String)
    
    var request: URLRequest{
        var components = URLComponents(string: baseURL)!
        components.path = path
        components.queryItems = queryComponents
        
        let url = components.url!
        return URLRequest(url: url)
    }
    
    private var baseURL: String {
        return "https://itunes.apple.com/"
    }
    
    private var path: String {
        switch self {
        case .search: return "/search"
        }
    }
    
    private struct ParameterKeys {
        static let term = "term"
        static let entity = "entity"
        static let limit = "limit"
    }
    
    private struct DefaultValues {
        static let entity = "software"
        static let limit = "200"
    }
    
    private var parameters: [String : Any] {
        switch self {
        case .search(let term):
            let parameters: [String : Any] = [
                ParameterKeys.term : term,
                ParameterKeys.entity : DefaultValues.entity,
                ParameterKeys.limit : DefaultValues.limit
            ]
            
            return parameters
        
        }
    }
    
    private var queryComponents: [URLQueryItem] {
        
        var components = [URLQueryItem]()
        
        for(key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.append(queryItem)
        }
        
        return components
    }
    
    
    
}
