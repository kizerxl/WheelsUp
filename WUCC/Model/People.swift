//
//  People.swift
//  WUCC
//
//  Created by Felix Changoo on 9/2/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

struct People: Codable {
    let name: String
    let birthYear: String
    let eyeColor: String
    let gender: String
    let hairColor: String
    let height: String
    let mass: String
    let skinColor: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let starships: [String]
    let vehicles: [String]
    let url: String
    let created: String
    let edited: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case gender
        case hairColor = "hair_color"
        case height
        case mass
        case skinColor = "skin_color"
        case homeworld
        case films
        case species
        case starships
        case vehicles
        case url
        case created
        case edited
    }
}

extension People: Properties {}

extension People: StarWarsCommonCategory {
    var swName: String {
        return name
    }
    
    var swBirthYear: String {
        return birthYear
    }
    
    var creationDate: String {
        return created
    }
    
    var initials: String {
        return name.getInitials() ?? ""
    }
    
    var properties: [String : Any]? {
        return getProperties()
    }
    
    var type: SWCategory {
        return .people
    }
}

