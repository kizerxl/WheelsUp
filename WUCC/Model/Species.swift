//
//  Species.swift
//  WUCC
//
//  Created by Felix Changoo on 9/2/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

struct Species: Codable {
    let name: String
    let classification: String
    let designation: String
    let averageHeight: String
    let averageLifespan: String
    let eyeColors: String
    let hairColors: String
    let skinColors: String
    let language: String
    let homeworld: String
    let people: [String]
    let films: [String]
    let url: String
    let created: String
    let edited: String
    
    enum CodingKeys : String, CodingKey {
        case name
        case classification
        case designation
        case averageHeight = "average_height"
        case averageLifespan = "average_lifespan"
        case eyeColors = "eye_colors"
        case hairColors = "hair_colors"
        case skinColors = "skin_colors"
        case language
        case homeworld
        case people
        case films
        case url
        case created
        case edited
    }
}

extension Species: Properties {}

extension Species: StarWarsCommonCategory {
    var initials: String {
        return name.getInitials() ?? ""
    }
    
    var swName: String {
        return name
    }
    
    var swBirthYear: String {
        return "n/a"
    }
    
    var creationDate: String {
        return created
    }
    
    var properties: [String : Any]? {
        return getProperties()
    }
    
    var type: SWCategory {
        return .species
    }
}
