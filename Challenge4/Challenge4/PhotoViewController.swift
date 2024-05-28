//
//  PhotoViewController.swift
//  Challenge4
//
//  Created by Joohee Kim on 5/28/24.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imagePath = photo?.image {
            let path = getDocumentsDirectory().appendingPathComponent(imagePath)
            imageView.image = UIImage(contentsOfFile: path.path)
        }
        
        if let name = photo?.name {
            title = name
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}
