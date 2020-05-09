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
        "Miami Beach": FlyoverAwesomePlace.miamiBeach,
        "Golden Gate Bridge": FlyoverAwesomePlace.sanFranciscoGoldenGateBridge
    ]

    @IBOutlet weak var flyMap: MKMapView!
    @IBOutlet weak var placedRabel: UILabel!
    @IBOutlet weak var locatourButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFlyMap()
    }
             
    @IBAction func locatourButtonTapped(_ sender: UIButton) {
        guard let randomLocatour = locatourDict.randomElement() else { return }
        let camera = FlyoverCamera(mapView: flyMap, configuration: FlyoverCamera.Configuration(duration: 6.0, altitude: 300, pitch: 45.0, headingStep: 40.0))
        camera.start(flyover: randomLocatour.value)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6)) {
            camera.stop()
        }
        placedRabel.text = "\(randomLocatour.key)"
    }
}

extension FlyOverViewC {
    
    func setUpFlyMap() {
        self.flyMap.mapType = .hybridFlyover
        self.flyMap.showsBuildings = true
        self.flyMap.isScrollEnabled = true
        self.flyMap.isZoomEnabled = true
    }
}



