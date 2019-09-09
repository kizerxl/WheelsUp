//
//  CategoryDetailCell.swift
//  WUCC
//
//  Created by Felix Changoo on 9/8/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

class CategoryDetailCell: UITableViewCell {
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var circleViewInitials: UILabel!
    
    override func prepareForReuse() {
        circleViewInitials.text = ""
        name.text = ""
        birthYear.text = ""
        createdAt.text = ""
    }
    
   func configure(with swCommonCategory: StarWarsCommonCategory) {
        circleView.layer.cornerRadius = circleView.frame.size.height/2
    
        circleViewInitials.text = swCommonCategory.initials
        name.text = swCommonCategory.swName
        birthYear.text = swCommonCategory.swBirthYear
        createdAt.text = Date.formatDate(date: swCommonCategory.creationDate)
    }
}
