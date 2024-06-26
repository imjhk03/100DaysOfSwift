//
//  ViewController.swift
//  Project1
//
//  Created by Joohee Kim on 5/8/24.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        performSelector(inBackground: #selector(fetchImages), with: nil)
        
        print(pictures)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @objc func fetchImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        let sorted = items.sorted()
        
        for item in sorted {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: ["Recommend this app!"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        let defaults = UserDefaults.standard
        let imageShownDictionary = defaults.object(forKey: "ImageShownDictionary") as? [String: Int] ?? [String: Int]()
        
        let shownCount = imageShownDictionary[pictures[indexPath.row], default: 0]
        
        cell.detailTextLabel?.text = "View count: \(shownCount)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.totalNumber = pictures.count
            vc.position = indexPath.row + 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

