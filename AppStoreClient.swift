//
//  AppStoreClient.swift
//  AppStoreContent
//
//  Created by Tharaka on 10/3/18.
//  Copyright © 2018 Tharaka. All rights reserved.
//


import Foundation

struct AppStoreClient {
    
    func fetchApps(withTerm term: String, completion: @escaping ([App]?) -> Void)
    {
        let searchEndpoint = AppStoreEndPoint.search(term: term)
        let searchUrlRequest = searchEndpoint.request
        
        let networkProcessor = NetworkProcessor(request: searchUrlRequest)
        networkProcessor.d
    }
}
