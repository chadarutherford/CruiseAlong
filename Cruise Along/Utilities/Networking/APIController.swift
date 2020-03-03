//
//  APIController.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreLocation
import Foundation

class APIController {
    
    var networkLoader: NetworkDataLoader!
    
    init(networkLoader: NetworkDataLoader = URLSession.shared) {
        self.networkLoader = networkLoader
    }
    
    func fetchAddresses(with term: String, location: CLLocationCoordinate2D, completion: @escaping (Result<[SearchAddress], CANetworkError>) -> Void) {
        guard let baseURL = URL(string: APIKeys.baseAddressURL)?.appendingPathComponent("\(term).json") else {
            completion(.failure(.invalidURL))
            return
        }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [
            URLQueryItem(name: "lon", value: "\(location.longitude)"),
            URLQueryItem(name: "lat", value: "\(location.latitude)"),
            URLQueryItem(name: "key", value: APIKeys.apiKey)
        ]
        guard let url = urlComponents?.url else {
            completion(.failure(.invalidURL))
            return
        }
        networkLoader.loadData(using: url) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.unableToComplete))
                }
                return
            }
            guard let response = response, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let searchResults = try decoder.decode(SearchResults.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(searchResults.results))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.unableToComplete))
                }
                return
            }
        }
    }
    
    func fetchRoutes(with destination: CLLocationCoordinate2D, origin: CLLocationCoordinate2D, completion: @escaping (Result<Route, CANetworkError>) -> Void) {
        guard let baseURL = URL(string: APIKeys.baseRouteURL)?.appendingPathComponent("\(destination.latitude),\(destination.longitude):\(origin.latitude),\(origin.longitude)").appendingPathComponent("json") else {
            completion(.failure(.invalidURL))
            return
        }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [
            URLQueryItem(name: "avoid", value: "unpavedRoads"),
            URLQueryItem(name: "key", value: APIKeys.apiKey)
        ]
        guard let url = urlComponents?.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        print(url)
        
        networkLoader.loadData(using: url) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    print("Broken")
                }
                return
            }

            guard let response = response, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                let route = try decoder.decode(Route.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(route))
                }
            } catch {
                DispatchQueue.main.async {
                    print(error)
                }
                return
            }
        }
    }
}
