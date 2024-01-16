//
//  LottoApiManager.swift
//  network_assignment
//
//  Created by Sammy Jung on 2024/01/16.
//
import Alamofire


struct LottoApiManager {
    func callRequest(number: Int, comletionHandler: @escaping (Lotto) -> Void){
        
        let numStr = String(number)
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(numStr)"
        
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let success):
                comletionHandler(success)
                print(success)
            case .failure(let failure):
                print("오류발생")
            }
        }

    }

}
