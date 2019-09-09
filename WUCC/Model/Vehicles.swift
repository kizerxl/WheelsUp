//
//  Vehicles.swift
//  WUCC
//
//  Created by Felix Changoo on 9/2/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

struct Vehicles: Codable {
    let name: String
    let model: String
    let vehicleClass: String
    let manufacturer: String
    let length: String
    let costInCredits: String
    let crew: String
    let passengers: String
    let maxAtmospheringSpeed: String
    let cargoCapacity: String
    let consumables: String
    let films: [String]
    let pilots: [String]
    let url: String
    let created: String
    let edited: String
    
    enum CodingKeys : String, CodingKey {
        case name
        case model
        case vehicleClass = "vehicle_class"
        case manufacturer
        case length
        case costInCredits = "cost_in_credits"
        case crew
        case passengers
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case cargoCapacity = "cargo_capacity"
        case consumables
        case films
        case pilots
        case url
        case created
        case edited
    }
}

extension Vehicles: Properties {}

extension Vehicles: StarWarsCommonCategory {
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
        return .vehicles
    }
}
