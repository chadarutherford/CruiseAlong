//
//  MapTests.swift
//  Cruise AlongTests
//
//  Created by Chad Rutherford on 3/4/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreLocation
import MapKit
import XCTest
@testable import Cruise_Along

class MapTests: XCTestCase {
    
    func testCoordinates() {
        let polyline = MKGeodesicPolyline(coordinates: routeCoordinates, count: routeCoordinates.count)
        let newCoordinates = polyline.coordinates
        for coordinate in routeCoordinates {
            for otherCoordinate in newCoordinates {
                XCTAssertEqual(coordinate.latitude, otherCoordinate.latitude, accuracy: 0.1)
                XCTAssertEqual(coordinate.longitude, otherCoordinate.longitude, accuracy: 0.1)
            }
        }
    }
}
