//
//  DiparViewC.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 5/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation


class DiparViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endPointConquerization()
    }
    
    func endPointConquerization() {
        
        guard let endPointUrl = URL(string: "https://ocr-text-extractor.p.rapidapi.com/detect-text-from-image-uri") else {
            return
        }
        
        var endPointRequest = URLRequest(url: endPointUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        let endPointHeader = ["x-rapidapi-host": "ocr-text-extractor.p.rapidapi.com",
        "x-rapidapi-key": "97d3dd987bmsh0f149682eeaad3dp1bc909jsn637214192f0b",
        "accept": "string",
        "content-type": "application/json"]
        
        endPointRequest.allHTTPHeaderFields = endPointHeader
        
        let jsonObject = ["Uri":"https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
          "Language": "eng",
          "DetectOrientation": false,
          "Scale": false,
          "IsTable": false,
          "OcrEngine": "Version2"
        ] as [String: Any]
        
        do {
            let requestBodyDataObject = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
            endPointRequest.httpBody = requestBodyDataObject
            
        } catch {
            print("error tryna create a requestBody")
        }
        
        endPointRequest.httpMethod = "POST"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: endPointRequest) { (data, response, error) in
            if data != nil && error == nil {
                do {
                    let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any]
                    
                    print(jsonDictionary)
                    
                } catch {
                    print("error parsing data: \(error.localizedDescription)")
                }
            }
        }
        dataTask.resume()
    }
     
     
    
}
