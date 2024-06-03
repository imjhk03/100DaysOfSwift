//
//  DetailViewController.swift
//  Challenge5
//
//  Created by Joohee Kim on 6/3/24.
//

import UIKit

class DetailViewController: UITableViewController {
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let country = country?.country {
            title = country
        }
    }
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: [country?.shareDetail() ?? ""], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6  // number of country properties to show
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Detail", for: indexPath)
        guard let country else { return cell }
        cell.textLabel?.numberOfLines = 0
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Capital city: \(country.capital_city)"
        case 1:
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSize = 3
            formatter.usesGroupingSeparator = true
            
            if let formattedNumber = formatter.string(from: country.population as NSNumber) {
                cell.textLabel?.text = "Population: \(formattedNumber)"
            }
        case 2:
            cell.textLabel?.text = "Official Language: \(country.official_language)"
        case 3:
            cell.textLabel?.text = "Currency: \(country.currency)"
        case 4:
            cell.textLabel?.text = "URL: \(country.url)"
        case 5:
            cell.textLabel?.text = "Time zone: \(country.time_zone)"
        default:
            break
        }
        return cell
    }

}
