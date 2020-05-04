//
//  RapidityViewC.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 5/1/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation

class RapidityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       print("viewDidLoad !")

        let headers = [
            "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
            "x-rapidapi-key": "97d3dd987bmsh0f149682eeaad3dp1bc909jsn637214192f0b"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://tripadvisor1.p.rapidapi.com/answers/list?limit=10&question_id=5283833")! as URL, cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })

        dataTask.resume()

    }
    

    

}
