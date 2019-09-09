//
//  CategoryItemDetailCell.swift
//  WUCC
//
//  Created by Felix Changoo on 9/9/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

class CategoryItemDetailCell: UITableViewCell {
    @IBOutlet weak var propertyLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    
    override func prepareForReuse() {
        propertyLbl.text = ""
        valueLbl.text = ""
    }
    
    func configure(with property: String, value: String) {
        propertyLbl.text = property
        valueLbl.text = value
    }
}
