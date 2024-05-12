//
//  ViewController.swift
//  Challenge1
//
//  Created by Joohee Kim on 5/12/24.
//

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        let sorted = items.sorted()
        
        for item in sorted {
            if item.hasSuffix("png") {
                flags.append(item)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        let countryName = flags[indexPath.row].components(separatedBy: ".").dropLast().joined().uppercased()
        cell.textLabel?.text = countryName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

