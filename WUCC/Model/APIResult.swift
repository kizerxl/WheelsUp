//
//  Result.swift
//  WUCC
//
//  Created by Felix Changoo on 9/2/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

struct APIResult<T: Codable>: Codable {
    let count: Double
    let next: String?
    let previous: String?
    let results: [T]
}
