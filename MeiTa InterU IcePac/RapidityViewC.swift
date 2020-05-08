//
//  RapidityViewC.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 5/1/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit


class RapidityViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

            let headers = [
                "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
                "x-rapidapi-key": "97d3dd987bmsh0f149682eeaad3dp1bc909jsn637214192f0b"
            ]
            
            let request = NSMutableURLRequest(url: NSURL(string: "https://tripadvisor1.p.rapidapi.com/photos/list?lang=en_US&currency=USD&limit=50&location_id=2233968")! as URL, cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    //         print(String(decoding: data!, as: UTF8.self))
                    let decoder = JSONDecoder()
                    guard let unwrappedData = data else { return }
                    
                    do {
                        let tripAdvsImgStruct = try decoder.decode(TripAdvImagesStruct.self, from: unwrappedData)
                        print(tripAdvsImgStruct.data[13].images.original.url)
                           
                    } catch {
                        print("tripadv images decoding failed")
                    }
                    
                }
            })
            dataTask.resume()
        }

}


// MARK: - Trial & Error

//        let headers = [
//            "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
//            "x-rapidapi-key": "97d3dd987bmsh0f149682eeaad3dp1bc909jsn637214192f0b"
//        ]

//        let request = NSMutableURLRequest(url: NSURL(string: "https://tripadvisor1.p.rapidapi.com/attractions/list-by-latlng?lunit=km&currency=USD&limit=30&distance=5&lang=en_US&longitude=100.87808&latitude=12.91285")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
//                print(String(decoding: data!, as: UTF8.self))
//            }
//        })
//
//        dataTask.resume()
