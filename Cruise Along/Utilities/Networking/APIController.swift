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
    
    func fetchAddresses(with term: String, location: CLLocationCoordinate2D, completion: @escaping (Result<[SearchAddress], CANetworkError>) -> ()) {
        guard let baseURL = URL(string: APIKeys.baseURL)?.appendingPathComponent("\(term).json") else {
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
            guard error == nil else { completion(.failure(.unableToComplete)); return }
            guard let response = response, response.statusCode == 200 else { completion(.failure(.invalidResponse)); return }
            guard let data = data else { completion(.failure(.noData)); return }
            let decoder = JSONDecoder()
            do {
                let searchResults = try decoder.decode(SearchResults.self, from: data)
                completion(.success(searchResults.results))
            } catch {
                completion(.failure(.unableToComplete))
                return
            }
        }
    }
}
