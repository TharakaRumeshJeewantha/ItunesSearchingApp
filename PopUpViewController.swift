//
//  PopUpViewController.swift
//  AppStoreContent
//
//  Created by Tharaka on 10/3/18.
//  Copyright © 2018 Tharaka. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var popImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var compayLabel: UILabel!
    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet var popBGView: UIView!
    @IBOutlet weak var popView: UIView!
    var appData: AppDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeBtn.layer.cornerRadius = 0.5 * closeBtn.bounds.size.width
        typeLabel.layer.borderWidth = 2.0
        typeLabel.layer.cornerRadius = 5
        typeLabel.layer.borderColor = #colorLiteral(red: 0.07300766455, green: 0.7396874535, blue: 0.7980199353, alpha: 1)
        popView.layer.cornerRadius = 20
        
        
        
        let touch = UITapGestureRecognizer(target: self, action: #selector(PopUpViewController.closePopUp(_:)))
        self.popBGView.addGestureRecognizer(touch)
        
        
        
        self.titleLabel.text = appData.appName
        let url = URL(string: appData.image!)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.popImage.image = UIImage(data: data!)
            }
        }
        self.compayLabel.text = appData.seller
        self.appLabel.text = "App"
        self.genreLabel.text = appData.genre
        self.typeLabel.text = appData.formattedPrice
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: true)
    }
    
    

}
