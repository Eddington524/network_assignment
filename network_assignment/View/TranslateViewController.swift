//
//  TtranslateViewController.swift
//  network_assignment
//
//  Created by Sammy Jung on 2024/01/17.
//

import UIKit
import Alamofire

class TranslateViewController: UIViewController {

    var sourceSelectedIdx = 0
    
    @IBOutlet var sourceLanguageButton: UIButton!
    @IBOutlet var translateButton: UIButton!
    
    @IBOutlet var sourceTextview: UITextView!
    @IBOutlet var changeButton: UIButton!
    
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var targetLanguageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        translateButton.addTarget(self, action: #selector(translateButtonClicked), for: .touchUpInside)
    }
    

    @IBAction func sourceButtonClicked(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: LanguageViewController.identifier) as! LanguageViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func targetButtonClicked(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: LanguageViewController.identifier) as! LanguageViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension TranslateViewController {
    
    @objc func translateButtonClicked() {
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        
        let headers: HTTPHeaders = ["X-Naver-Client-Id":APIKey.clientId, "X-Naver-Client-Secret":APIKey.clientSecret]
        
        let parameters: Parameters = ["text": sourceTextview.text!, "source": "ko","target":"en"]
        
        AF.request(url, method: .post,parameters: parameters ,headers: headers).responseDecodable(of: PaPago.self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                self.targetLabel.text = success.message.result.translatedText
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

extension TranslateViewController {
    

}
