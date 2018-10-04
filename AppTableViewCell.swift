//
//  AppTableViewCell.swift
//  AppStoreContent
//
//  Created by Tharaka on 10/3/18.
//  Copyright © 2018 Tharaka. All rights reserved.
//


import UIKit

class AppTableViewCell: UITableViewCell {


    @IBOutlet weak var artworkImageView: UIImageView!
    
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    
    var app:AppDetail! {
    didSet{
        self.updateUI()
    }
    }
    
    func updateUI()
    {
        appName.text = app.appName
        sellerName.text = app.seller! + " (App)"
        let url = URL(string: app.image!)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) 
			DispatchQueue.main.async {
                self.artworkImageView.image = UIImage(data: data!)
            }
        }
    }
}
