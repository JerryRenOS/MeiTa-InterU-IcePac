//
//  CoreMapViewC.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 5/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import MapKit
import Foundation
import UIKit

class CoreMapViewController: UIViewController {
    
    @IBOutlet weak var appleMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAppleMap(title: "Coney-Beach-Walka", subtitle: "Bravos for clicking", latitude: 40.5731, longtitude: -73.9712)
    }
    
    func setUpAppleMap(title: String, subtitle: String, latitude: Double, longtitude: Double) {
        let pinAnnotation = MKPointAnnotation()
        pinAnnotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        pinAnnotation.title = title
        pinAnnotation.subtitle = subtitle
        appleMapView.addAnnotation(pinAnnotation)
        let zoomedToTargetRegion = MKCoordinateRegion(center: pinAnnotation.coordinate, latitudinalMeters: 20006, longitudinalMeters: 20006)
        appleMapView.setRegion(zoomedToTargetRegion, animated: true)
        
    }
}
