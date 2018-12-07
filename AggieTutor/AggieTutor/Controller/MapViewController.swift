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

class TutorAnnotation:MKPointAnnotation{
    var tutor:Tutor!
    var button = UIButton(type: .infoLight)
    var navigationController: UINavigationController!
    init(tutor: Tutor, nav:UINavigationController) {
        super.init()
        let img = UIImage(named: "right_arrow")
        self.button.setImage(img, for: .normal)
        self.navigationController = nav
        self.title = tutor.name
        self.subtitle = tutor.teaching
        self.coordinate = CLLocation(latitude: tutor.lat, longitude: tutor.long).coordinate
        self.tutor = tutor
        self.button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
    }
    @objc func clicked(){
        let storyboard = UIStoryboard(name: "JobsTutors", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TutorDetailVC") as! TutorCellDetailViewController
        vc.name = tutor.name
        vc.hourlyRate = "\(tutor.hourly_wage)"
        vc.classTeaching = tutor.teaching
        vc.qualifications = tutor.qual
        navigationController.pushViewController(vc, animated: true)
    }
}

class MapViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    var curTutors = [Tutor]()
    let locationManager = CLLocationManager()
    var ref: DatabaseReference!
    //let centerLocation = CLLocation(latitude: 38.539719, longitude: -121.749516)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "blue") as Any]
        self.navigationController?.navigationBar.tintColor = UIColor(named: "blue")
        // TextField Color Customization
        
        mapView.showsUserLocation = true
        for tutor in curTutors{
            self.mapView.addAnnotation(TutorAnnotation(tutor: tutor, nav: self.navigationController!))
        }
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    override func willMove(toParent parent: UIViewController?) {
        if parent == nil
        {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            self.navigationController?.navigationBar.tintColor = .white
        }
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
        let tutorAnnotation = annotation as! TutorAnnotation
        view.rightCalloutAccessoryView = tutorAnnotation.button
        view.glyphImage = UIImage(named: "person_pin")
        view.markerTintColor = UIColor(named: "blue")
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
