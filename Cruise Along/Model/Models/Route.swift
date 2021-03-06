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
    let instructions: [Instructions]
    
    enum RouteKeys: String, CodingKey {
        case routes
        case summary
        case length = "lengthInMeters"
        case time = "travelTimeInSeconds"
        case arrivalTime
        case legs
        case points
        case guidance
        case instructions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RouteKeys.self)
        var routesContainer = try container.nestedUnkeyedContainer(forKey: .routes)
        let routeContainer = try routesContainer.nestedContainer(keyedBy: RouteKeys.self)
        let summaryContainer = try routeContainer.nestedContainer(keyedBy: RouteKeys.self, forKey: .summary)
        var legsContainer = try routeContainer.nestedUnkeyedContainer(forKey: .legs)
        let legContainer = try legsContainer.nestedContainer(keyedBy: RouteKeys.self)
        let guidanceContainer = try routeContainer.nestedContainer(keyedBy: RouteKeys.self, forKey: .guidance)
        length = try summaryContainer.decode(Double.self, forKey: .length)
        time = try summaryContainer.decode(Int.self, forKey: .time)
        arrivalTime = try summaryContainer.decode(Date.self, forKey: .arrivalTime)
        points = try legContainer.decode([Point].self, forKey: .points)
        instructions = try guidanceContainer.decode([Instructions].self, forKey: .instructions)
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

struct Instructions: Codable {
    let turn: Double?
    let point: Point
    let combine: Bool
    let message: String
    let combinedMessage: String?
    
    enum InstructionKeys: String, CodingKey {
        case turn = "turnAngleInDecimalDegrees"
        case point
        case combine = "possibleCombineWithNext"
        case message
        case combinedMessage
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: InstructionKeys.self)
        turn = try container.decodeIfPresent(Double.self, forKey: .turn)
        point = try container.decode(Point.self, forKey: .point)
        combine = try container.decode(Bool.self, forKey: .combine)
        message = try container.decode(String.self, forKey: .message)
        combinedMessage = try container.decodeIfPresent(String.self, forKey: .combinedMessage)
    }
}
