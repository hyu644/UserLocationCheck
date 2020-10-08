//
//  ViewController.swift
//  UserLocationCheck
//
//  Created by hyu on R 2/07/15.
//  Copyright © Reiwa 2 hyu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.mapView.delegate = self
 }
    override func viewDidAppear(_ animated: Bool) {
     
        CLLocationManager.locationServicesEnabled()
        
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.notDetermined{
            print("notDetermined")
            locationManager.requestWhenInUseAuthorization()
        }else if status == CLAuthorizationStatus.restricted{
            print("restricted")
        }else if status == CLAuthorizationStatus.authorizedWhenInUse{
            print("authorizedWhenInUse")
        }else if status == CLAuthorizationStatus.authorizedAlways{
            print("authorizedAlways")
        }else{
            print("not allowed")
        }
           
        locationManager.startUpdatingLocation()
        
        mapView.mapType = MKMapType.standard
        mapView.region.center = mapView.userLocation.coordinate
        
        mapView.userTrackingMode = MKUserTrackingMode.follow
        mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
    }
}

