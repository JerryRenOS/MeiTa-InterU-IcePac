//
//  ViewController.swift
//  Circprogresularity
//
//  Created by Jerry Ren on 1/18/21.
//

import UIKit

class FrontRunningViewController: UIViewController, URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let byfinbi  = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
    //        self.circularLayer.strokeEnd = byfinbi / 4.35
    // syncing download progress with the progress track (not working properly if the download is too fast)
        }
        print(totalBytesWritten, totalBytesExpectedToWrite)
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    }
    
    private let circularLayer = CAShapeLayer()
    private var filledOrNot = true // perform the ternary operation in  future commit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circularRendering()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(piTraversal)))
    }
    
    func circularRendering() {
//        let centerOfView = view.center
//        let circularPath = UIBezierPath(arcCenter: centerOfView, radius: 101, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 2, clockwise: true)
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 101, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        trackBuilder(bezierPath: circularPath)
        circulationBuilder(using: circularPath)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [self] in
            piTraversal()
            circularLayer.fillColor = UIColor.clear.cgColor
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                circularLayer.fillColor = UIColor.black.cgColor
                circularLayer.lineWidth = 6.5
            }
        }
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(piTraversal)))
    }
    
    // MARK: -
    
    private func trackBuilder(bezierPath: UIBezierPath) {
        let layerOfTrack = CAShapeLayer.init()
        layerOfTrack.path = bezierPath.cgPath
        let desiredStrokeColor = generatingColorWithRGB(red: 204, green: 238, blue: 255, alpha: 1)
        layerOfTrack.strokeColor = desiredStrokeColor.cgColor
        layerOfTrack.lineWidth = 8.6
        layerOfTrack.fillColor = .none
        layerOfTrack.position = view.center    //important
        view.layer.addSublayer(layerOfTrack)
    }
    
    private func circulationBuilder(using path: UIBezierPath) {
        circularLayer.path = path.cgPath
        circularLayer.strokeColor = UIColor.systemTeal.cgColor
        circularLayer.lineCap = .round
        circularLayer.lineWidth = 8.6
        circularLayer.strokeEnd = 0
        circularLayer.position = view.center
        circularLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1) //-CGFloat.pi = 逆时针90度
        view.layer.addSublayer(circularLayer)
    }
    
    // MARK: -
    
    private let downloadableUrlString = "https://cdn.myanimelist.net//images//anime//12//82828.jpg?s=98fde86014a4379263b182edaf19ee32"
    
    private func downloadHasBegun() {
        circularLayer.strokeEnd = 0  //0<strokeend<1//
        
        let defaultConfiguration = URLSessionConfiguration.default
        let operationQue = OperationQueue.init()
        let urlsessionObject = URLSession(configuration: defaultConfiguration, delegate: self, delegateQueue: operationQue)
        guard let url = URL(string: downloadableUrlString) else {
            print("invalid url buddy")
        return }
        let downloaderTask = urlsessionObject.downloadTask(with: url)
        downloaderTask.resume()
    }
    
    @objc fileprivate func piTraversal() {
        downloadHasBegun()
        
        let fundamentalAnimation = CABasicAnimation(keyPath: "strokeEnd") // keyPath bar for bar necessary
        fundamentalAnimation.toValue = 1
        fundamentalAnimation.duration = 2
        fundamentalAnimation.fillMode = .forwards
        fundamentalAnimation.isRemovedOnCompletion = false
        circularLayer.fillColor = UIColor.clear.cgColor // future ternary
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

