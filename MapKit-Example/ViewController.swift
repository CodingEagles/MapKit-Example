//
//  ViewController.swift
//  MapKit-Example
//
//  Created by Mario Matheus on 11/10/18.
//  Copyright © 2018 Coding Eagles. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var firstOpen = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MapKit"
        mapView.showsUserLocation = true
        locationManager.delegate = self
        
        prepareLocationUpdating()
    }
    
    
    func prepareLocationUpdating() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    func showRegionWith(coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
        
        mapView.setRegion(region, animated: true)
    }


}


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if firstOpen {
            firstOpen = false
            showRegionWith(coordinate: locations.last!.coordinate)
        }
    }
    
}

