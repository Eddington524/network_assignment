//
//  LottoViewController.swift
//  network_assignment
//
//  Created by Sammy Jung on 2024/01/16.
//

import UIKit

struct Lotto: Codable {
    let drwNo: Int
    let drwNoDate: String
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

class LottoViewController: UIViewController {

    @IBOutlet var numberTextField: UITextField!
    
    @IBOutlet var luckyLabels: [UILabel]!
    
    @IBOutlet var plusLabel: UILabel!
    let manager = LottoApiManager()
    
    var lottoPickerView = UIPickerView()
    
    var luckyNumbers: [Int] = []
    let numberlist: [Int] = Array(1...1102).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.callRequest(number: 1102) { values in
            
//            self.luckyLabels[0].text = "\(values.drwtNo1)"
//            self.luckyLabels[1].text = "\(values.drwtNo2)"
//            self.luckyLabels[2].text = "\(values.drwtNo3)"
//            self.luckyLabels[3].text = "\(values.drwtNo4)"
//            self.luckyLabels[4].text = "\(values.drwtNo5)"
//            self.luckyLabels[5].text = "\(values.drwtNo6)"
//            self.luckyLabels[6].text = "\(values.bnusNo)"
            
            self.luckyNumbers = [
                values.drwtNo1,
                values.drwtNo2,
                values.drwtNo3,
                values.drwtNo4,
                values.drwtNo5,
                values.drwtNo6,
                values.bnusNo
            ]

            for (index, number) in self.luckyNumbers.enumerated() {
                self.luckyLabels[index].text = "\(number)"
            }
        
        }
        numberTextField.tintColor = .clear
        numberTextField.inputView = lottoPickerView
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        
    }
    
}


extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        numberlist.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,inComponent component: Int) {
        
        numberTextField.text = "\(numberlist[row])회차"
        
        manager.callRequest(number: numberlist[row]) { values in
            
            self.luckyNumbers = [
                values.drwtNo1,
                values.drwtNo2,
                values.drwtNo3,
                values.drwtNo4,
                values.drwtNo5,
                values.drwtNo6,
                values.bnusNo
            ]

            for (index, number) in self.luckyNumbers.enumerated() {
                self.luckyLabels[index].text = "\(number)"
            }
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
       
        return "\(numberlist[row])회차"
    }
}
