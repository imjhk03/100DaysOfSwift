//
//  DetailViewController.swift
//  Challenge1
//
//  Created by Joohee Kim on 5/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String? {
        didSet {
            countryName = selectedImage?.components(separatedBy: ".").dropLast().joined().uppercased() ?? ""
        }
    }
    var countryName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = countryName
        
        if let image = selectedImage {
            imageView.image = UIImage(named: image)
        }
        
        imageView.layer.borderWidth = 1
        
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, countryName ?? ""], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
