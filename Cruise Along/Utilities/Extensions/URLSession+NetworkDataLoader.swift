//
//  URLSession+NetworkDataLoader.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import Foundation

extension URLSession: NetworkDataLoader {
    func loadData(using request: URLRequest, completion: @escaping (Data?, HTTPURLResponse?, Error?) -> Void) {
        dataTask(with: request) { data, response, error in
            completion(data, response as? HTTPURLResponse, error)
        }.resume()
    }
    
    func loadData(using url: URL, completion: @escaping (Data?, HTTPURLResponse?, Error?) -> Void) {
        dataTask(with: url) { data, response, error in
            completion(data, response as? HTTPURLResponse, error)
        }.resume()
    }
}
