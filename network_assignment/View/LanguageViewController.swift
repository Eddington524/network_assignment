//
//  LanguageViewController.swift
//  network_assignment
//
//  Created by Sammy Jung on 2024/01/17.
//

import UIKit

struct Languages {
   static let list: [[String:String]] = [["ko":"한국어"], ["en":"영어"], ["ja":"일본어"], ["zh-CN":"중국어(간체)"],["zh-TW":"중국어(번체)"], ["vi": "베트남어"], ["id":"인도네시아어"],["th":"태국어"], ["de":"독일어"], ["ru":"러시아어"], ["es":"스페인어"], ["it": "이탈리아어"], ["fr":"프랑스어"]]
    
    static var valuesArray: [String] {
           return list.compactMap { $0.values.first }
       }
}

class LanguageViewController: UIViewController {

    let languegesDictionary = Languages.list
    let values = Languages.valuesArray

    var selectedIdx:Int = 0
    
    @IBOutlet var languageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    
    }
    

}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageTableViewCell.identifier, for: indexPath) as! LanguageTableViewCell
        
        cell.languageLabel.text = values[indexPath.row]
        
        cell.languageLabel.highlightedTextColor = .green
    
        let backgroundCell = UIView()
        backgroundCell.backgroundColor = .white
        
        cell.selectedBackgroundView = backgroundCell
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: TranslateViewController.identifier) as! TranslateViewController
//        
//        print(vc.sourceSelectedIdx)
//        if vc.sourceSelectedIdx == indexPath.row {
//            cell.languageLabel.textColor = .green
//        }else{
//            cell.languageLabel.textColor = .black
//        }
        
//        if selectedIdx == indexPath.row {
//            cell.languageLabel.textColor = .green
//        }else{
//            cell.languageLabel.textColor = .black
//        }
//        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIdx = indexPath.row
//        let vc = storyboard?.instantiateViewController(withIdentifier: TranslateViewController.identifier) as! TranslateViewController
//        
//        vc.sourceSelectedIdx = indexPath.row
        
//        print(vc.sourceSelectedIdx)
    }
    
    func configureTableView() {
        languageTableView.delegate = self
        languageTableView.dataSource = self
    }
    
}


