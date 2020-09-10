//
//  AudiViewController.swift
//  PlayaAV
//
//  Created by Jerry Ren on 9/9/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import AVFoundation

class AudiViewController: UIViewController {

    @IBOutlet weak var playButo: UIButton!
    
    var playa:  AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    @IBAction func playaTouched(_ sender: UIButton) {
        
        if let playa = playa, playa.isPlaying {
            playa.stop()
            playButo.setTitle("Playa", for: .normal)
        }
            
        else {
            let audiURLString = Bundle.main.path(forResource: "fadeZ", ofType: "mp3")
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let audiURLString = audiURLString else { return }
                playa = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audiURLString))
                guard let playa = playa else { return }
                playa.play()
                
               playButo.setTitle("Stop it", for: .normal)
            }
            catch {
                print("audio gone south")
            }
        }
        
    }
    
}

