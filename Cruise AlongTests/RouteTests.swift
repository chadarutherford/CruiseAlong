//
//  RouteTests.swift
//  Cruise AlongTests
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreLocation
import XCTest
@testable import Cruise_Along

class RouteTests: XCTestCase {
    
    func testPoint() {
        let decoder = JSONDecoder()
        let point = try! decoder.decode(Point.self, from: pointData)
        XCTAssertNoThrow(point)
        XCTAssertNotNil(point)
        XCTAssertEqual(40.40010, point.latitude, accuracy: 0.001)
        XCTAssertEqual(-80.6037, point.longitude, accuracy: 0.001)
    }
    
    func testInstruction() {
        let decoder = JSONDecoder()
        let instruction = try! decoder.decode(Instructions.self, from: instructionData)
        XCTAssertNoThrow(instruction)
        XCTAssertNotNil(instruction)
        XCTAssertEqual(-90, instruction.turn)
        XCTAssertEqual(true, instruction.combine)
        XCTAssertEqual("Turn left onto Marland Heights Rd", instruction.message)
        XCTAssertEqual("Turn left onto Marland Heights Rd then bear left at Marland Heights Rd", instruction.combinedMessage)
        
    }
    
    func testRoute() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let route = try! decoder.decode(Route.self, from: routeData)
        XCTAssertNoThrow(route)
        XCTAssertNotNil(route)
        guard let point = route.points.first else { return }
        XCTAssertNotNil(point)
        XCTAssertEqual(40.40001, point.latitude, accuracy: 0.001)
        XCTAssertEqual(-80.60342, point.longitude, accuracy: 0.001)
        guard let instruction = route.instructions.first else { return }
        XCTAssertEqual("Leave from Rothrock Ave", instruction.message)
    }
    
    func testMockFetchRoutes() {
        let mockLoader = MockLoader()
        mockLoader.data = routeData
        var dataRoute: Route?
        
        let controller = APIController(networkLoader: mockLoader)
        let routesExpectation = expectation(description: "Waiting for routes")
        
        controller.fetchRoutes(with: CLLocationCoordinate2D(latitude: 40.40010, longitude: -80.6037), origin: CLLocationCoordinate2D(latitude: 40.39213, longitude: -80.59451)) { results in
            switch results {
            case .success(let route):
                dataRoute = route
                routesExpectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        
        wait(for: [routesExpectation], timeout: 2)
        guard let route = dataRoute, let point = route.points.first else { return }
        guard let instruction = route.instructions.first else { return }
        XCTAssertNotNil(point)
        XCTAssertEqual(40.40001, point.latitude, accuracy: 0.001)
        XCTAssertEqual(-80.60342, point.longitude, accuracy: 0.001)
        XCTAssertEqual("Leave from Rothrock Ave", instruction.message)
    }
}
