//
//  ManifestationFuncs.swift
//  AlphaRadioactive
//
//  Created by Jerry Ren on 5/22/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
import SceneKit
import ARKit
import UIKit


extension AlphaRadioactiveViewController {
    
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

}
