//
//  BeerApiManager.swift
//  network_assignment
//
//  Created by Sammy Jung on 2024/01/17.
//

import Foundation
import Alamofire

struct BeerApiManager {
    
    func callRequest(completionHandler: @escaping ([Beer]) -> Void) {
        let url = "https://api.punkapi.com/v2/beers/random"
        
        AF.request(url, method: .get).responseDecodable(of: [Beer].self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
}


