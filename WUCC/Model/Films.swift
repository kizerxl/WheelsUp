//
//  Films.swift
//  WUCC
//
//  Created by Felix Changoo on 9/2/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

struct Films: Codable {
    let title: String
    let episodeId: Double
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let species: [String]
    let starships: [String]
    let vehicles: [String]
    let characters: [String]
    let planets: [String]
    let url: String
    let created: String
    let edited: String
    
    enum CodingKeys : String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case species
        case starships
        case vehicles
        case characters
        case planets
        case url
        case created
        case edited
    }
}

extension Films: Properties {}

extension Films: StarWarsCommonCategory {
    var initials: String {
        return title.getInitials() ?? ""
    }
    
    var swName: String {
        return title
    }
    
    var swBirthYear: String {
        return releaseDate
    }
    
    var creationDate: String {
        return created
    }
    
    var properties: [String : Any]? {
        return getProperties()
    }
    
    var type: SWCategory {
        return .films
    }
}
