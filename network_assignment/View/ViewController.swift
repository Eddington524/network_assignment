//
//  ViewController.swift
//  network_assignment
//
//  Created by Sammy Jung on 2024/01/16.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var beerImageView: UIImageView!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    let manager = BeerApiManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        getBeerData()
    }

    @IBAction func randomButtonClicked(_ sender: Any) {
        
        getBeerData()
    }
    
}

extension ViewController {
    func getBeerData(){
        manager.callRequest { beerArr in
            
            let beer: Beer = beerArr[0]
            let urlstr = beer.image_url
            let url = URL(string: urlstr)
            
            let imageURL = url
            self.beerImageView.kf.setImage(with: url,placeholder: UIImage(systemName: "photo"))
            
            
            self.nameLabel.text = beer.name
            self.descriptionLabel.text = beer.description

        }
    }
}
