//
//  ViewController.swift
//  SpeedFinder
//
//  Created by BALA SEKHAR on 05/11/20.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController {

    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager=CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }


}
extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        let location=locations[0]
        
        let span:MKCoordinateSpan=MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let currentLocation:CLLocationCoordinate2D=CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let region:MKCoordinateRegion=MKCoordinateRegion(center: currentLocation, span: span)
        mapView.setRegion(region, animated: true)
        mapView.tintColor = .red
        mapView.showsUserLocation=true
        
        speedLabel.text="Speed : \(Int(location.speed * 3.6)) km/h"
    }
}
