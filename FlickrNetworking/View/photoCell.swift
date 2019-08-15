//
//  photoCell.swift
//  FlickrNetworking
//
//  Created by Burak Akin on 13.08.2019.
//  Copyright © 2019 Burak Akin. All rights reserved.
//

import UIKit

class photoCell: UITableViewCell {

    
    @IBOutlet weak var flickrPhotoImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.flickrPhotoImageView.image = nil
        
    }
    
    func configureCell(photo: Photo) {
        let stringURL = "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
        
        ImageService.getImage(withUrl: stringURL) { (image) in
            self.flickrPhotoImageView.image = image
        }
    }
    
   

}


