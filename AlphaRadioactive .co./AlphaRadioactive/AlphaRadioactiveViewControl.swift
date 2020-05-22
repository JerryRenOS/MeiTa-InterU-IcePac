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
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        sceneView.delegate = self
        
        manifestDiciness()
        
    }
    

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
            
            let planeAnchor = anchor as! ARPlaneAnchor
            
            let scenePlane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            let planeNode = SCNNode()
            planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2 , 1, 0, 0)
            
            let gridMaterial = SCNMaterial()
            gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
            scenePlane.materials = [gridMaterial]
            planeNode.geometry = scenePlane
            
            node.addChildNode(planeNode)
            
        } else {
            return
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal
        
        
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
