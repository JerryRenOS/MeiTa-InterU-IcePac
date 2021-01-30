//
//  ViewController.swift
//  DeployableBuild_HelloWorld
//
//  Created by Yan Ren on /21.
//

import UIKit

class HelloWorldViewController: UIViewController {
    
    static let colorPool: [UIColor] = [.systemRed, .systemBlue, .systemPink, .systemTeal]
    
    private lazy var helloworldLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Georgia", size: 30)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(helloworldLabel)
        helloworldConstraintsActivation()
        animateHelloWorld()
    }
    override func viewDidLayoutSubviews() {
        print(view.frame.width * view.frame.size.width)
    }
    
    private func helloworldConstraintsActivation() {
        helloworldLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            helloworldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloworldLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            helloworldLabel.heightAnchor.constraint(equalToConstant: 33),
            helloworldLabel.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        ])
    }
    
    private func animateHelloWorld() {
        self.helloworldLabel.text = ""
        let entireDisplay = "Hello World"
        var unitCount = 0
        
        for singleTextUnit in entireDisplay {
            Timer.scheduledTimer(withTimeInterval: Double(unitCount) * 0.15, repeats: false) { (hwTimer) in
                guard let colorRandomized = HelloWorldViewController.colorPool.randomElement() else {
                    return
                }
                self.helloworldLabel.textColor = colorRandomized
                self.helloworldLabel.text?.append(singleTextUnit)
                print(hwTimer)
            }
            unitCount += 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(entireDisplay.count) * 0.15) {
            self.helloworldLabel.textColor = .systemTeal
        }
    }
}

