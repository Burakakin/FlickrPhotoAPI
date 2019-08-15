//
//  DetailViewController.swift
//  FlickrNetworking
//
//  Created by Burak Akin on 15.08.2019.
//  Copyright © 2019 Burak Akin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var flickrDetailİmageView: UIImageView!
    
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ImageService.getImage(withUrl: urlString!) { (image) in
            self.flickrDetailİmageView.image = image
        }
    }
    
    @IBAction func dismiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
}
