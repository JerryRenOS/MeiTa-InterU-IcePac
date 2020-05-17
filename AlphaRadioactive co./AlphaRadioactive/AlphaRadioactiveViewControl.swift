//
//  ViewController.swift
//  AlphaRadioactiveViewControl
//
//  Created by Jerry Ren on 5/16/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class AlphaRadioactiveViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView.delegate = self
        manifestSpherical()
    }
    
    // MARK: - Spherical

    func manifestSpherical() {
        let spherical = SCNSphere(radius: 0.1)
        let spherMaterial = SCNMaterial()
        spherMaterial.diffuse.contents = UIImage(named: "art.scnassets/EarthyTexture2K.jpg")
        spherMaterial.specular.contents = UIImage(named: "art.scnassets/EarthyTexture2K.jpg")
        spherMaterial.normal.contents = UIImage(named: "Normal")
        
        //try  EarthySpecular2k.tif when have chance
        

        // can have one or two different buttons on the bottom for different showcase effects
// (E.g. both diffuse and specular to earthTexture2K and no other settings would have a cool effect)
        
        
        spherical.materials = [spherMaterial]
        
        let spherNode = SCNNode()
        spherNode.position = SCNVector3(0, -0.1, -0.5)
        spherNode.geometry = spherical
        
        let action = SCNAction.rotate(by: -360 * CGFloat(Double.pi / 30), around: SCNVector3(0 ,0.1, 0), duration: 13)
        spherNode.runAction(action)
        
        sceneView.scene.rootNode.addChildNode(spherNode)
        sceneView.autoenablesDefaultLighting = true

    }
    

    // MARK: - Cubicle
    
    func manifestCubicle() {
        let cubicle = SCNBox(width: 0.08, height: 0.08, length: 0.08, chamferRadius: 0.008)
        let cubiMaterial = SCNMaterial()
        cubiMaterial.diffuse.contents = UIColor.gray
        cubicle.materials = [cubiMaterial]
        let cubiNode = SCNNode()
        cubiNode.position = SCNVector3(0, 0.1, -0.5)
        cubiNode.geometry = cubicle
        
        sceneView.scene.rootNode.addChildNode(cubiNode)
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARWorldTrackingConfiguration()
        
        print(ARWorldTrackingConfiguration.isSupported)

        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        sceneView.session.pause()
    }
}
 



// Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
 

// MARK: - SCNAction

//    let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 360), around: SCNVector3(0, 1, 0), duration: 6)
//    //   let repeatedAction = SCNAction.repeatForever(action)
//       let desiredAction = SCNAction.repeat(action, count: 2)
//       self.runAction(desiredAction)
