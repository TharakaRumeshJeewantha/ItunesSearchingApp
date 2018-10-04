//
//  AppDetail.swift
//  AppStoreContent
//
//  Created by Tharaka on 10/3/18.
//  Copyright © 2018 Tharaka. All rights reserved.
//

import Foundation

struct AppDetail {
    
    var appName: String?
    var genre: String?
    var seller: String?
    var image: String?
    var formattedPrice: String?
    
    init(appName: String?, genre: String?, seller: String?, image: String?, price: String?) {
        
        self.appName = appName
        self.genre = genre
        self.seller = seller
        self.image = image
        self.formattedPrice = price
        
        
    }
}
