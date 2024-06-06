//
//  ViewController.swift
//  Project16
//
//  Created by Joohee Kim on 6/4/24.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics", wikipedia: "https://en.wikipedia.org/wiki/London")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.", wikipedia: "https://en.wikipedia.org/wiki/Oslo")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.85, longitude: 2.3508), info: "Often called the City of Light", wikipedia: "https://en.wikipedia.org/wiki/Paris")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.", wikipedia: "https://en.wikipedia.org/wiki/Rome")
        let wasington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.", wikipedia: "https://en.wikipedia.org/wiki/Washington,_D.C.")
        
        mapView.addAnnotations([london, oslo, paris, rome, wasington])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(changeMapType))
    }
    
    @objc func changeMapType() {
        let ac = UIAlertController(title: "Change map view", message: "Select a map type to draw the map", preferredStyle: .actionSheet)
        let satellite = UIAlertAction(title: "Satellite", style: .default) { [weak self] _ in
            self?.mapView.mapType = .satellite
        }
        let hybrid = UIAlertAction(title: "Hybrid", style: .default) { [weak self] _ in
            self?.mapView.mapType = .hybrid
        }
        let mutedStandard = UIAlertAction(title: "MutedStandard", style: .default) { [weak self] _ in
            self?.mapView.mapType = .mutedStandard
        }
        let standard = UIAlertAction(title: "Standard", style: .default) { [weak self] _ in
            self?.mapView.mapType = .standard
        }
        ac.addAction(satellite)
        ac.addAction(hybrid)
        ac.addAction(mutedStandard)
        ac.addAction(standard)
        present(ac, animated: true)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotaionView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        annotaionView?.pinTintColor = .systemBlue
        
        if annotaionView == nil {
            annotaionView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotaionView?.canShowCallout = true
            annotaionView?.pinTintColor = .systemBlue
            
            let btn = UIButton(type: .detailDisclosure)
            annotaionView?.rightCalloutAccessoryView = btn
        } else {
            annotaionView?.annotation = annotation
        }
        
        return annotaionView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
//        let placeName = capital.title
//        let placeInfo = capital.info
//        
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
        
        let vc = WebViewController()
        vc.capital = capital
        navigationController?.pushViewController(vc, animated: true)
    }
}

