//
//  CategoryDetailViewModel.swift
//  WUCC
//
//  Created by Felix Changoo on 9/7/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

class CategoryDetailViewModel<T: Codable> {
    var apiResult: APIResult<T>
    var networkClient: Networking
    var type: SWCategory
    var categoryItems: [T]
    
    init(_ networkClient: Networking = NetworkClient(), apiResult: APIResult<T>, type: SWCategory) {
        self.networkClient = networkClient
        self.apiResult = apiResult
        self.type = type
        self.categoryItems = apiResult.results
    }
}
