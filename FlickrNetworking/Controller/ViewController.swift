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
    
    private var pageNumber: Int = 1
    
    @IBOutlet var photoCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData(page: pageNumber)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "detail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let rowSelected = (sender as! IndexPath).row
            if let DetailVC =  segue.destination as? DetailViewController {
                let id = photo[rowSelected].id
                let farm = photo[rowSelected].farm
                let server = photo[rowSelected].server
                let secret = photo[rowSelected].secret
                let stringURL = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
                DetailVC.urlString = stringURL
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == photo.count - 1 {
            pageNumber += 1
            fetchData(page: pageNumber)
            print(pageNumber)
            
        }
    }
}
