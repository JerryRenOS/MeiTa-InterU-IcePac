//
//  NetworkDispatch.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 5/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
      
import UIKit
import Foundation
import os.log

// split this file into two in the future potentially

class ITerGer {
    
    static let shared = ITerGer()
    private init() {}
    
    func APICaller(using urlString: String, completion: @escaping (Data?, Error?) -> Void)
    {
        guard let url = URL(string: urlString) else {
            completion(nil, NetworkError.NotAValidURL)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, error)
        }.resume()
    }
}

enum NetworkError: Error {
    case NotAValidURL
}

extension DiparViewController {
    
    
    func dispatch() {

        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        ITerGer.shared.APICaller(using:  "") { (data, _) in
            defer { dispatchGroup.leave() }
            guard let unwrappedData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
      //          let newzFeed = try decoder.decode(Newzfeed.self, from: unwrappedData)

                   
                
                
            }
            catch {
                os_log("Error: ", error.localizedDescription)
            }
        }
        dispatchGroup.notify(queue: .main) {
           // reload teburu, UI animations & stuff
        }
    }
}
