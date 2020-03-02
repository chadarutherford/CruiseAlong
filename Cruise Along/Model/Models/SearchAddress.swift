//
//  SearchAddress.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import Foundation

struct SearchAddress: Codable {
    let distance: Double
    let address: String
    let latitude: Double
    let longitude: Double
    
    enum AddressKeys: String, CodingKey {
        case distance = "dist"
        case addressContainer = "address"
        case address = "freeformAddress"
        case position
        case latitude = "lat"
        case longitude = "lon"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AddressKeys.self)
        let addressContainer = try container.nestedContainer(keyedBy: AddressKeys.self, forKey: .addressContainer)
        let positionContainer = try container.nestedContainer(keyedBy: AddressKeys.self, forKey: .position)
        distance = try container.decode(Double.self, forKey: .distance)
        address = try addressContainer.decode(String.self, forKey: .address)
        latitude = try positionContainer.decode(Double.self, forKey: .latitude)
        longitude = try positionContainer.decode(Double.self, forKey: .longitude)
    }
}

struct SearchResults: Codable {
    let results: [SearchAddress]
    
    enum ResultsKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultsKeys.self)
        results = try container.decode([SearchAddress].self, forKey: .results)
    }
}
