//
//  ViewController.swift
//  FlickrNetworking
//
//  Created by Burak Akin on 12.08.2019.
//  Copyright © 2019 Burak Akin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private let client = FlickrClient()
    
    var photo = [Photo]()
    
    @IBOutlet var photoCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData(page: 1)
    }
    
    func fetchData(page: Int) {
        client.getFeed(page: page) { [weak self] result in
            switch result {
            case .success(let recentPhoto):
                guard let recentPhoto = recentPhoto?.photos.photo else { return }
                self!.photo.append(contentsOf: recentPhoto)
                DispatchQueue.main.async {
                    self!.photoCell.reloadData()
                }
                
                //print(recentPhoto)
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
    

}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photo.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! photoCell
        let photos = photo[indexPath.row]
        cell.configureCell(photo: photos)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == photo.count - 1 {
            print("End of page")
            fetchData(page: 2)
        }
    }
}
