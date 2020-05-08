//
//  TripAdvImagesStruct.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 5/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct TripAdvImagesStruct: Codable {
    var data: [dataChunk]
}

struct dataChunk: Codable {
    var images: ImageDefinitions
    var is_blessed: Bool
}
           
struct ImageDefinitions: Codable {
    var small: definitionDetails
    var thumbnail: definitionDetails
    var original: definitionDetails
    var large: definitionDetails
    var medium: definitionDetails
}

struct definitionDetails: Codable {
    var url: String
}
