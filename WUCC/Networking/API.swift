//
//  API.swift
//  WUCC
//
//  Created by Felix Changoo on 9/2/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://swapi.co"
}

enum APIServiceError: String, Error {
    case apiError = "There was an api Error"
    case invalidEndpoint = "Endpoint is invalid"
    case invalidResponse = "Response is invalid"
    case noData = "No data was returned"
    case decodeError = "No data could be decoded"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    enum StarWarsEndpoints: Endpoint {
        case getPeople, getFilms, getStarships,
        getVehicles, getSpecies, getPlanets

        var path: String {
            switch self {
                case .getPeople: return "/api/people/"
                case .getFilms: return "/api/films/"
                case .getStarships: return "/api/starships/"
                case .getVehicles: return "/api/vehicles/"
                case .getSpecies: return "/api/species/"    
                case .getPlanets: return "/api/planets/"
            }
        }
        
        var url: String {
                switch self {
                    case .getPeople: return "\(API.baseUrl)\(path)"
                    case .getFilms: return "\(API.baseUrl)\(path)"
                    case .getStarships: return "\(API.baseUrl)\(path)"
                    case .getVehicles: return "\(API.baseUrl)\(path)"
                    case .getSpecies: return "\(API.baseUrl)\(path)"
                    case .getPlanets: return "\(API.baseUrl)\(path)"
                }
        }
    }
}


