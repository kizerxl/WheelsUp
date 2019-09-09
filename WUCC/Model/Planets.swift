//
//  Planets.swift
//  WUCC
//
//  Created by Felix Changoo on 9/2/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

struct Planets: Codable {
    let name: String
    let diameter: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let gravity: String
    let population: String
    let climate: String
    let terrain: String
    let surfaceWater: String
    let residents: [String]
    let films: [String]
    let url: String
    let created: String
    let edited: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case diameter
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case gravity
        case population
        case climate
        case terrain
        case surfaceWater = "surface_water"
        case residents
        case films
        case url
        case created
        case edited
    }
}

extension Planets: Properties {}

extension Planets: StarWarsCommonCategory {
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
        return .planets
    }
}
