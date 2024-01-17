//
//  LanguageTableViewCell.swift
//  network_assignment
//
//  Created by Sammy Jung on 2024/01/17.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }

    @IBOutlet var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
}
