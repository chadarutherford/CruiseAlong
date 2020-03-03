//
//  Route.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreLocation
import Foundation

struct Route: Codable {
    let length: Double
    let time: Int
    let arrivalTime: Date
    let points: [Point]
    
    enum RouteKeys: String, CodingKey {
        case routes
        case summary
        case length = "lengthInMeters"
        case time = "travelTimeInSeconds"
        case arrivalTime
        case legs
        case points
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RouteKeys.self)
        var routesContainer = try container.nestedUnkeyedContainer(forKey: .routes)
        let routeContainer = try routesContainer.nestedContainer(keyedBy: RouteKeys.self)
        let summaryContainer = try routeContainer.nestedContainer(keyedBy: RouteKeys.self, forKey: .summary)
        var legsContainer = try routeContainer.nestedUnkeyedContainer(forKey: .legs)
        let legContainer = try legsContainer.nestedContainer(keyedBy: RouteKeys.self)
        length = try summaryContainer.decode(Double.self, forKey: .length)
        time = try summaryContainer.decode(Int.self, forKey: .time)
        arrivalTime = try summaryContainer.decode(Date.self, forKey: .arrivalTime)
        points = try legContainer.decode([Point].self, forKey: .points)
    }
}

struct Point: Codable {
    let latitude: Double
    let longitude: Double
    
    enum PointKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PointKeys.self)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
    }
}
