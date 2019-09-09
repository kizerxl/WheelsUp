//
//  StarWarsCategoryCell.swift
//  WUCC
//
//  Created by Felix Changoo on 9/2/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

class StarWarsCategoryCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbl: UILabel!

    override func prepareForReuse() {
        lbl.text = ""
        imgView.image = .none
    }
    
    private func customizeView() {
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shadowRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 1
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 8
        clipsToBounds = true
    }

    func configure(with starWarsCategory: StarWarsCategory) {
        lbl.text = starWarsCategory.type.rawValue.uppercased()
        
        let imageName = starWarsCategory.imageName
        imgView.image = UIImage(named: imageName)
        
        customizeView()
    }
}

