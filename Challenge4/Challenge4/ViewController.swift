//
//  ViewController.swift
//  Challenge4
//
//  Created by Joohee Kim on 5/28/24.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var photos: [Photo] = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(takePhotos))
        
        let defaults = UserDefaults.standard
        
        if let savedPhotos = defaults.object(forKey: "photos") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                photos = try jsonDecoder.decode([Photo].self, from: savedPhotos)
            } catch {
                print("Failed to load photos")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Photo", for: indexPath)
        let photo = photos[indexPath.item]
        cell.textLabel?.text = photo.name
        let path = getDocumentsDirectory().appendingPathComponent(photo.image)
        cell.imageView?.image = UIImage(contentsOfFile: path.path)
        return cell
    }
    
    @objc func takePhotos() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .camera
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let photo = Photo(name: "Unknown", image: imageName)
        photos.append(photo)
        save()
        tableView.reloadData()
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showActionAlert(at: indexPath)
    }
    
    func showActionAlert(at indexPath: IndexPath) {
        let ac = UIAlertController(title: "Action", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Rename", style: .default, handler: { [weak self] _ in
            self?.renamePhoto(indexPath)
        }))
        
        ac.addAction(UIAlertAction(title: "Show photo", style: .default, handler: { [weak self] _ in
            self?.showPhoto(indexPath)
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func renamePhoto(_ indexPath: IndexPath) {
        let ac = UIAlertController(title: "Rename photo", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak ac] _ in
            guard let newName = ac?.textFields?[0].text else { return }
            self?.photos[indexPath.row].name = newName
            self?.save()
            self?.tableView.reloadData()
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func showPhoto(_ indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PhotoView") as? PhotoViewController {
            vc.photo = photos[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(photos) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "photos")
        } else {
            print("Failed to save photos.")
        }
    }
}

