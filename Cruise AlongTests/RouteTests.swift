//
//  RouteTests.swift
//  Cruise AlongTests
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

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
    
    func testRoute() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let route = try! decoder.decode(Route.self, from: routeData)
        XCTAssertNoThrow(route)
        XCTAssertNotNil(route)
        guard let point = route.points.first else { return }
        XCTAssertNotNil(point)
        XCTAssertEqual(40.39213, point.latitude, accuracy: 0.001)
        XCTAssertEqual(-80.59451, point.longitude, accuracy: 0.001)
    }
}
