//
//  UtilitiesTest.swift
//  Cruise AlongTests
//
//  Created by Chad Rutherford on 3/3/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreLocation
import XCTest
@testable import Cruise_Along

class UtilitiesTest: XCTestCase {
    
    func testFormatUtilities() {
        let decoder = JSONDecoder()
        let result = try! decoder.decode(SearchAddress.self, from: singleAddressData)
        let location = CLLocation(latitude: 40.40006894, longitude: -80.60361426)
        let distance = location.distance(from: CLLocation(latitude: result.latitude, longitude: result.longitude))
        let distanceString = FormatUtilities.formatDistance(meters: distance)
        XCTAssertEqual("0.7 mi", distanceString)
    }
}
