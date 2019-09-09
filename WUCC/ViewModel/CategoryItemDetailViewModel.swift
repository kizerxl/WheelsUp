//
//  CategoryItemDetailViewModel.swift
//  WUCC
//
//  Created by Felix Changoo on 9/7/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

class CategoryItemDetailViewModel {
    let properties: [String: Any]
    let initials: String
    let birthYear: String
    let name: String
    
    init(properties: [String: Any], initials: String, birthYear: String, name: String) {
        self.properties = properties
        self.initials = initials
        self.birthYear = birthYear
        self.name = name
    }
}
