//
//  ViewController.swift
//  Circprogresularity
//
//  Created by Jerry Ren on 1/18/21.
//

import UIKit

class FrontRunningViewController: UIViewController {
    private let circularLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circularRendering()
    }
    
    func circularRendering() {
        let centerOfView = view.center
        let circularPath = UIBezierPath(arcCenter: centerOfView, radius: 101, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 2, clockwise: true)
        
        // track-builder
        let layerOfTrack = CAShapeLayer.init()
        layerOfTrack.path = circularPath.cgPath
        layerOfTrack.strokeColor = UIColor.black.cgColor
        layerOfTrack.lineWidth = 8.6
        layerOfTrack.fillColor = .none
        view.layer.addSublayer(layerOfTrack)
        // track-builder
        
        circularLayer.path = circularPath.cgPath
        circularLayer.strokeColor = UIColor.systemTeal.cgColor
        circularLayer.lineCap = .round
        circularLayer.lineWidth = 8.6
        circularLayer.strokeEnd = 0
        view.layer.addSublayer(circularLayer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [self] in
            piTraversal()
            circularLayer.fillColor = UIColor.clear.cgColor
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                circularLayer.fillColor = UIColor.black.cgColor
                circularLayer.lineWidth = 6.5
            }
        }
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(piTraversal)))
    }
    
    @objc fileprivate func piTraversal() {
        let fundamentalAnimation = CABasicAnimation(keyPath: "strokeEnd") // keyPath bar for bar necessary
        fundamentalAnimation.toValue = 1
        fundamentalAnimation.duration = 2
        fundamentalAnimation.fillMode = .forwards
        fundamentalAnimation.isRemovedOnCompletion = false
        circularLayer.add(fundamentalAnimation, forKey: "fundamentalism")
    }
}


// self-entertainment, unrelated 
public func navigationBarGlobalConfiguration() {
    UINavigationBar.appearance().barTintColor = .white
    UINavigationBar.appearance().tintColor = .systemIndigo
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemTeal]
    UINavigationBar.appearance().isTranslucent = false
}

