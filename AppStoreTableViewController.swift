//
//  AppStoreTableViewController.swift
//  AppStoreContent
//
//  Created by Tharaka on 10/3/18.
//  Copyright © 2018 Tharaka. All rights reserved.
//


import UIKit

class AppStoreTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var apps:[AppDetail]?
    var api = ApiController()
    
    var isSearching = false
    
    struct Storyboard {
        static let appCell = "AppCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        self.tableView.keyboardDismissMode = .onDrag
    }
    
    func fetchApps(searchText: String)
    {
        let jsonUrl = AppStoreEndPoint.search(term: searchText)
        let url = jsonUrl.request.url
        api.getJsonFromUrl(url: url!) { (apps) in
            self.apps = apps
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let apps = apps {
            return apps.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.appCell, for: indexPath) as! AppTableViewCell

        cell.app = apps?[indexPath.row]
        cell.selectionStyle = .none

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let indexPath = tableView.indexPathForSelectedRow

        let sb = UIStoryboard(name: "PopUp", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! PopUpViewController
        popup.appData = apps?[(indexPath?.row)!]
        self.present(popup, animated: true)
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            apps?.removeAll()
            self.tableView.reloadData()
        } else {
            apps?.removeAll()
            self.tableView.reloadData()
            fetchApps(searchText: searchText)
        }
    }
}
