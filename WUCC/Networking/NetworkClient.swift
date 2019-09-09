//
//  NetworkClient.swift
//  WUCC
//
//  Created by Felix Changoo on 9/2/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

protocol Networking: class {
    func allPeopleCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<People>,
        APIServiceError>) -> ())
    func allFilmsCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<Films>,
        APIServiceError>) -> ())
    func allStarshipsCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<Starships>,
        APIServiceError>) -> ())
    func allVehiclesCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<Vehicles>,
        APIServiceError>) -> ())
    func allSpeciesCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<Species>,
        APIServiceError>) -> ())
    func allPlanetsCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<Planets>,
        APIServiceError>) -> ())
    func performCategoryRequest<T>(for resource: Resource, with completion: @escaping (Result<APIResult<T>, APIServiceError>) -> ()) 
}

final class NetworkClient: Networking {
    func allPeopleCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<People>, APIServiceError>) -> ()) {
        performCategoryRequest(for: resource, with: completion)
    }
    
    func allFilmsCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<Films>, APIServiceError>) -> ()) {
        performCategoryRequest(for: resource, with: completion)
    }
    
    func allStarshipsCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<Starships>, APIServiceError>) -> ()) {
        performCategoryRequest(for: resource, with: completion)
    }
    
    func allVehiclesCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<Vehicles>, APIServiceError>) -> ()) {
        performCategoryRequest(for: resource, with: completion)
    }
    
    func allSpeciesCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<Species>, APIServiceError>) -> ()) {
        performCategoryRequest(for: resource, with: completion)
    }
    
    func allPlanetsCategoryRequest(resource: Resource, completion: @escaping (Result<APIResult<Planets>, APIServiceError>) -> ()) {
        performCategoryRequest(for: resource, with: completion)
    }
    
    func performCategoryRequest<T>(for resource: Resource, with completion: @escaping (Result<APIResult<T>, APIServiceError>) -> ()) where T : Decodable, T : Encodable {
        guard let request = buildRequest(from: resource) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                DispatchQueue.main.async {
                    completion(.failure(.apiError))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(APIResult<T>.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch let error {
                DispatchQueue.main.async {
                    print("Error is \(error.localizedDescription)")
                    completion(.failure(.decodeError))
                }
            }
        }.resume()
    }

    private func buildRequest(from resource: Resource)-> URLRequest? {
        let url = resource.url
        
        guard var component = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return nil
        }
        
        component.queryItems = resource.parameters.map { URLQueryItem(name: $0, value: $1) }
        
        guard let resolvedUrl = component.url else {
            return nil
        }
        
        var request = URLRequest(url: resolvedUrl)
        request.httpMethod = resource.httpMethod
        
        return request
    }
}
