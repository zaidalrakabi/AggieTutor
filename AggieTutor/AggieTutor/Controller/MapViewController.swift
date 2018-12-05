//
//  MapViewController.swift
//  AggieTutor
//
//  Created by doMore on 12/3/18.
//  Copyright © 2018 Aggie Tutor. All rights reserved.
//
import UIKit
import MapKit
import CoreLocation
import FirebaseDatabase
import FirebaseAuth

class MapViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var ref: DatabaseReference!
    //let centerLocation = CLLocation(latitude: 38.539719, longitude: -121.749516)
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        
        let address1 = "Howard Way, Davis, CA,  USA"
        addAnnotationAtAddress(address: address1, title: "MU")
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let uID = Auth.auth().currentUser!.uid
        ref = Database.database().reference()
        ref.child("users/\(uID)/longitude").setValue(mapView.userLocation.coordinate.latitude.description)
        ref.child("users/\(uID)/latitude").setValue(mapView.userLocation.coordinate.longitude.description)
    }
    
    // add an Annotation with a coordinate: CLLocationCoordinate2D
    func addAnnotationAtCoordinate(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Tutor!"
        mapView.addAnnotation(annotation)
    }
    
    // add an annotation with an address: String
    func addAnnotationAtAddress(address: String, title: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let placemarks = placemarks {
                if placemarks.count != 0 {
                    let coordinate = placemarks.first!.location!
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = coordinate.coordinate
                    annotation.title = title
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
    }
}
