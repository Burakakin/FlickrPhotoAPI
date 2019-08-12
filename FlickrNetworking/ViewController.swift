//
//  ViewController.swift
//  FlickrNetworking
//
//  Created by Burak Akin on 12.08.2019.
//  Copyright © 2019 Burak Akin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let client = FlickrClient()
    
    var photo = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        client.getFeed { [weak self] result in
            switch result {
            case .success(let recentPhoto):
                guard let recentPhoto = recentPhoto?.photos.photo else { return }
                self!.photo.append(contentsOf: recentPhoto)
                print(self!.photo[0].id)
                print(recentPhoto)
            case .failure(let error):
                print("the error \(error)")
            }
        }
       
    }

    

}

