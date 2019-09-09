//
//  RootViewModel.swift
//  WUCC
//
//  Created by Felix Changoo on 9/7/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class RootViewModel {
    
    private let networkClient: Networking
    private let _swCategories: [[StarWarsCategory]]
    private var _peopleResult = BehaviorRelay<APIResult<People>?>(value: .none)
    private var _filmsResult = BehaviorRelay<APIResult<Films>?>(value: .none)
    private var _starshipsResult = BehaviorRelay<APIResult<Starships>?>(value: .none)
    private var _vehiclesResult = BehaviorRelay<APIResult<Vehicles>?>(value: .none)
    private var _speciesResult = BehaviorRelay<APIResult<Species>?>(value: .none)
    private var _planetsResult = BehaviorRelay<APIResult<Planets>?>(value: .none)
    
    var swCategories: [[StarWarsCategory]] {
        get {
            return _swCategories
        }
    }
    
    var peopleResult: Driver<APIResult<People>?> {
        get {
            return _peopleResult.asDriver()
        }
    }
    
    var filmsResult: Driver<APIResult<Films>?> {
        get {
            return _filmsResult.asDriver()
        }
    }
    
    var starshipsResult: Driver<APIResult<Starships>?> {
        get {
            return _starshipsResult.asDriver()
        }
    }
    
    var vehiclesResult: Driver<APIResult<Vehicles>?> {
        get {
            return _vehiclesResult.asDriver()
        }
    }
    
    var speciesResult: Driver<APIResult<Species>?> {
        get {
            return _speciesResult.asDriver()
        }
    }
    
    var planetsResult: Driver<APIResult<Planets>?> {
        get {
            return _planetsResult.asDriver()
        }
    }
    
    init(_ networkClient: Networking = NetworkClient()) {
        self.networkClient = networkClient
        
        _swCategories = [
            [StarWarsCategory(type: .people, imageName: "noun_person_1880095", categoryURL: Endpoints.StarWarsEndpoints.getPeople.url)],
            [StarWarsCategory(type: .films, imageName: "noun_Film_1666495", categoryURL:
                Endpoints.StarWarsEndpoints.getFilms.url),
            StarWarsCategory(type: .starships, imageName: "noun_person_1880095", categoryURL: Endpoints.StarWarsEndpoints.getStarships.url)],
            [StarWarsCategory(type: .vehicles, imageName: "noun_Car_1881053", categoryURL: Endpoints.StarWarsEndpoints.getVehicles.url)],
            [StarWarsCategory(type: .species, imageName: "noun_alien_627223", categoryURL: Endpoints.StarWarsEndpoints.getSpecies.url)],
            [StarWarsCategory(type: .planets, imageName: "noun_Planet_1867071", categoryURL: Endpoints.StarWarsEndpoints.getPlanets.url)]
        ]
    }
    
    func performRequest(for category: SWCategory, urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let resource = Resource(url: url)
        
        switch category {
            case .people: performAllPeopleRequest(resource: resource)
            case .films: performAllFilmsRequest(resource: resource)
            case .starships: performAllStarShipsRequest(resource: resource)
            case .vehicles: performAllVehiclesRequest(resource: resource)
            case .species: performAllSpeciesRequest(resource: resource)
            case .planets: performAllPlanetsRequest(resource: resource)
        }
    }
    
    private func performAllPeopleRequest(resource: Resource) {
        networkClient.allPeopleCategoryRequest(resource: resource) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
                case .success(let starWarsCategory):
                    strongSelf._peopleResult.accept(starWarsCategory)
                case .failure(let error):
                    print("\(error)")
            }
        }
    }
    
    private func performAllFilmsRequest(resource: Resource) {
        networkClient.allFilmsCategoryRequest(resource: resource) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
                case .success(let starWarsCategory):
                    strongSelf._filmsResult.accept(starWarsCategory)
                case .failure(let error):
                    print("\(error)")
            }
        }
    }
    
    private func performAllStarShipsRequest(resource: Resource) {
        networkClient.allStarshipsCategoryRequest(resource: resource) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
                case .success(let starWarsCategory):
                    strongSelf._starshipsResult.accept(starWarsCategory)
                case .failure(let error):
                    print("\(error)")
            }
        }
    }
    
    private func performAllVehiclesRequest(resource: Resource) {
        networkClient.allVehiclesCategoryRequest(resource: resource) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
                case .success(let starWarsCategory):
                    strongSelf._vehiclesResult.accept(starWarsCategory)
                case .failure(let error):
                    print("\(error)")
            }
        }
    }

    private func performAllSpeciesRequest(resource: Resource) {
        networkClient.allSpeciesCategoryRequest(resource: resource) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
                case .success(let starWarsCategory):
                    strongSelf._speciesResult.accept(starWarsCategory)
                case .failure(let error):
                    print("\(error)")
            }
        }
    }

    private func performAllPlanetsRequest(resource: Resource) {
        networkClient.allPlanetsCategoryRequest(resource: resource) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
                case .success(let starWarsCategory):
                    strongSelf._planetsResult.accept(starWarsCategory)
                case .failure(let error):
                    print("\(error)")
            }
        }
    }
}
