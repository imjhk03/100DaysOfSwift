//
//  ListTableViewController.swift
//  Project4
//
//  Created by Joohee Kim on 5/13/24.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var websites = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let webSitesURL = Bundle.main.url(forResource: "websites", withExtension: "txt") {
            if let websitesList = try? String(contentsOf: webSitesURL) {
                websites = websitesList.components(separatedBy: "\n")
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebView") as? ViewController {
            vc.selectedWebsite = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
