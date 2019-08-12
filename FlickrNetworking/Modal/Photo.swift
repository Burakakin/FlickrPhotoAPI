//
//  Photo.swift
//  FlickrNetworking
//
//  Created by Burak Akin on 12.08.2019.
//  Copyright © 2019 Burak Akin. All rights reserved.
//

import Foundation

struct FlickrAPI: Decodable {
    let photos: Photos
}

struct Photos: Decodable {
    let photo: [Photo]
}

struct Photo: Decodable {
    
    let id: String
    let title: String
}

//struct PhotoFeedResult: Decodable {
//
//    let results: [Photo]
//}
