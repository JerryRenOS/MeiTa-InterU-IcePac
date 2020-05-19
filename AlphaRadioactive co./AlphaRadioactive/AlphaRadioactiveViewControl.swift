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
    
    // MARK: - Diciness
    
    func manifestDiciness() {
        sceneView.autoenablesDefaultLighting = true
        let diceyScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        if let diceyNode = diceyScene.rootNode.childNode(withName: "Dice", recursively: true) {
            diceyNode.position = SCNVector3(x: 0, y: 0, z: -0.1)
            sceneView.scene.rootNode.addChildNode(diceyNode)
            
            let rotationAction = SCNAction.rotate(by: -360 * CGFloat(Double.pi / 90), around: SCNVector3(0, 0.1, 0), duration: 17)
            diceyNode.runAction(rotationAction)
        }
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
