//
//  Protocols.swift
//  WUCC
//
//  Created by Felix Changoo on 9/7/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

protocol Properties {}

protocol StarWarsCommonCategory {
    var initials: String { get }
    var swName: String { get }
    var swBirthYear: String { get }
    var creationDate: String { get }
    var properties: [String: Any]? { get }
    var type: SWCategory { get }
}
