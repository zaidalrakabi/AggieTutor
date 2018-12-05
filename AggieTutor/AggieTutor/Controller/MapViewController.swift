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
    var curTutors = [Tutor]()
    let locationManager = CLLocationManager()
    var ref: DatabaseReference!
    //let centerLocation = CLLocation(latitude: 38.539719, longitude: -121.749516)
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        for tutor in curTutors{
            let annotation = MKPointAnnotation()
            print(tutor.long)
            annotation.coordinate = CLLocation(latitude: tutor.lat, longitude: tutor.long).coordinate
            annotation.title = tutor.name
            annotation.subtitle = tutor.teaching
            self.mapView.addAnnotation(annotation)
        }
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let uID = Auth.auth().currentUser!.uid
        ref = Database.database().reference()
        let loc = locationManager.location!.coordinate
        ref.child("users/\(uID)/longitude").setValue(Double(loc.longitude.description))
        ref.child("users/\(uID)/latitude").setValue(Double(loc.latitude.description))
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //Check if annotation is userLocation
        if(annotation.isEqual(mapView.userLocation))
        {   //Bail
            return nil
        }
        let view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "marker")
        view.canShowCallout = true
        view.rightCalloutAccessoryView = UIButton(type: .infoLight)
        return view
    }
    
    // add an Annotation with a coordinate: CLLocationCoordinate2D
    func addAnnotationAtCoordinate(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Tutor!"
        mapView.addAnnotation(annotation)
    }
    
    // add an annotation with an address: String
    func addAnnotationAtAddress(address: String, title: String, subtitle: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let placemarks = placemarks {
                if placemarks.count != 0 {
                    let coordinate = placemarks.first!.location!
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = coordinate.coordinate
                    annotation.title = title
                    annotation.subtitle = subtitle
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
    }
}
