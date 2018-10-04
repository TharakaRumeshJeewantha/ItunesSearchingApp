//
//  App.swift
//  AppStoreContent
//
//  Created by Tharaka on 10/3/18.
//  Copyright © 2018 Tharaka. All rights reserved.
//

import Foundation

struct App {
    var name: String
    var seller: String
    var genre: String
    var artworkUrl: URL?
    
    private struct APIKeys {
        static let name = "trackName"
        static let seller = "sellerName"
        static let genre = "primaryGenreName"
        static let artworkUrl = "artworkUrl60"
    }
    
    init?(dictionary: [String : Any]) {
        guard let name = dictionary[APIKeys.name] as? String,
            let artworkUrlString = dictionary[APIKeys.artworkUrl] as? String,
            let seller = dictionary[APIKeys.seller] as? String,
            let genre = dictionary[APIKeys.genre] as? String else {
                return nil
        }
        
        self.name = name
        self.artworkUrl = URL(string: artworkUrlString)
        self.seller = seller
        self.genre = genre
    }
}
