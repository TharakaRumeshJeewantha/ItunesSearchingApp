//
//  APIController.swift
//  AppStoreContent
//
//  Created by Tharaka on 10/3/18.
//  Copyright © 2018 Tharaka. All rights reserved.
//

import Foundation

class ApiController {
    
    var iosApps: [AppDetail] = []
    
    func getJsonFromUrl(url: URL, completion: @escaping ([AppDetail]?) -> Void)
    {
        iosApps.removeAll()
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                if let appArray = jsonObj!.value(forKey: "results") as? NSArray {
                    for app in appArray{
                        if let appDict = app as? NSDictionary {
                            let appName = appDict.value(forKey: "trackName")
                            let genre = appDict.value(forKey: "primaryGenreName")
                            let seller = appDict.value(forKey: "sellerName")
                            let image = appDict.value(forKey: "artworkUrl60")
                            let price = appDict.value(forKey: "formattedPrice")
                            let newApp:AppDetail = AppDetail(appName: appName as? String, genre: genre as? String, seller: seller as? String, image: image as? String, price: price as? String)
                            self.iosApps.append(newApp)                     
                        }
                    }
                }
        
                completion(self.iosApps)
            }
        }).resume()
        
            }
}
