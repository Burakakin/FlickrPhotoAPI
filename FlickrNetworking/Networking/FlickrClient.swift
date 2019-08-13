//
//  FlickrClient.swift
//  FlickrNetworking
//
//  Created by Burak Akin on 12.08.2019.
//  Copyright © 2019 Burak Akin. All rights reserved.
//

import Foundation

class FlickrClient: APIClient {
   
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getFeed(page: Int, completion: @escaping (Result<FlickrAPI?, APIError>) -> Void) {
        
//        let serverURL = "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=374fe3ac30cb2970ec9f555af4939833&per_page=20&format=json&nojsoncallback=1"
        
        let serverURL = "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=374fe3ac30cb2970ec9f555af4939833&per_page=20&page=\(page)&format=json&nojsoncallback=1"

        let url = URL(string: serverURL)!
        
        fetch(with: url, decode: { (json) in
            guard let recentPhoto = json as? FlickrAPI else { return  nil }
            return recentPhoto
        }, completion: completion)


    }
    
    
}
