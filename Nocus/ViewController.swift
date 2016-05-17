//
//  ViewController.swift
//  Nocus
//
//  Created by Omar Sherief on 5/16/16.
//  Copyright © 2016 Project(X). All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var nocusMapView: MKMapView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            nocusMapView.delegate = self;
            
            let userLocation = nocusMapView.userLocation
            
            var locManager = CLLocationManager()
            locManager.requestWhenInUseAuthorization()
            var currentLocation = CLLocation!()
            
            if(CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedAlways){
                    
                    currentLocation = locManager.location
                    nocusMapView.showsUserLocation = true
                centerMapOnLocation(currentLocation)
            }
            
            let gestureRecognizer = UILongPressGestureRecognizer(target: self, action:"handleTap:")
            gestureRecognizer.delegate = self
            nocusMapView.addGestureRecognizer(gestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(gestureReconizer: UILongPressGestureRecognizer) {
        
        if(gestureReconizer.state == UIGestureRecognizerState.Began){
            let location = gestureReconizer.locationInView(nocusMapView)
            let coordinate = nocusMapView.convertPoint(location,toCoordinateFromView: nocusMapView)
            
            // Add annotation:
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
        nocusMapView.addAnnotation(annotation)
        }}
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
       nocusMapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        let noteVC = self.storyboard!.instantiateViewControllerWithIdentifier("takeNotes")
        self.presentViewController(noteVC, animated: false, completion: nil)
        
    }
}

