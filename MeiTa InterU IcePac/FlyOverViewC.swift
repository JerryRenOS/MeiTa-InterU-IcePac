//
//  FlyOverViewC.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 5/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import FlyoverKit
import UIKit
import MapKit

class FlyOverViewC: UIViewController, MKMapViewDelegate {
    
    let locatourDict = [
        "Statue of Liberty": FlyoverAwesomePlace.newYorkStatueOfLiberty,
        "Central Park": FlyoverAwesomePlace.centralParkNY,
        "Golden Gate Bridge": FlyoverAwesomePlace.sanFranciscoGoldenGateBridge,
        "Miami Beach": FlyoverAwesomePlace.miamiBeach,
        "Eiffel Tower": FlyoverAwesomePlace.parisEiffelTower
    ]
    // these are replaceable with
    // CLLocationCoordinate2D(latitude:, longitude: )

    @IBOutlet weak var flyMap: MKMapView!
    @IBOutlet weak var placedRabel: UILabel!
    @IBOutlet weak var locatourButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFlyMap()
    }
             
    @IBAction func locatourButtonTapped(_ sender: UIButton) {
        guard let randomLocatour = locatourDict.randomElement() else { return }
        let camera = FlyoverCamera(mapView: flyMap, configuration: FlyoverCamera.Configuration(duration: 11.0, altitude: 300, pitch: 45.0, headingStep: 40.0))
        camera.start(flyover: randomLocatour.value)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(11)) {
            camera.stop()
        }
        placedRabel.text = "\(randomLocatour.key)"
    }
}

extension FlyOverViewC {
    
    func setUpFlyMap() {
        self.flyMap.showsBuildings = true
        self.flyMap.isScrollEnabled = true
        self.flyMap.isZoomEnabled = true
        self.flyMap.mapType = .hybridFlyover
    }
}



