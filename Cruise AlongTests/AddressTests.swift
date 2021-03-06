//
//  AddressTests.swift
//  Cruise AlongTests
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreLocation
import XCTest
@testable import Cruise_Along

class AddressTests: XCTestCase {
    
    func testSingleAddressResult() {
        let decoder = JSONDecoder()
        let searchResult = try! decoder.decode(SearchAddress.self, from: singleAddressData)
        XCTAssertNoThrow(searchResult)
        XCTAssertNotNil(searchResult)
        XCTAssertEqual(1145.0453667693146, searchResult.distance, accuracy: 0.001)
        XCTAssertEqual("4052 Washington St, Weirton, WV 26062", searchResult.address)
        XCTAssertEqual(40.39222, searchResult.latitude, accuracy: 0.001)
        XCTAssertEqual(-80.5944, searchResult.longitude, accuracy: 0.001)
    }
    
    func testSearchResults() {
        let decoder = JSONDecoder()
        let searchResults = try! decoder.decode(SearchResults.self, from: resultsData)
        XCTAssertNoThrow(searchResults)
        XCTAssertNotNil(searchResults)
        XCTAssertEqual(10, searchResults.results.count)
        let searchResult = searchResults.results[0]
        XCTAssertEqual(1145.0453667693146, searchResult.distance, accuracy: 0.001)
        XCTAssertEqual("4052 Washington St, Weirton, WV 26062", searchResult.address)
        XCTAssertEqual(40.39222, searchResult.latitude, accuracy: 0.001)
        XCTAssertEqual(-80.5944, searchResult.longitude, accuracy: 0.001)
    }
    
    func testMockSearchAddresses() {
        let mockLoader = MockLoader()
        mockLoader.data = resultsData
        var addressesArray = [SearchAddress]()
        let controller = APIController(networkLoader: mockLoader)
        let addressExpectation = expectation(description: "Waiting for address")
        
        controller.fetchAddresses(with: "term", location: CLLocationCoordinate2D(latitude: 40.39222, longitude: -80.5944)) { results in
            switch results {
            case .success(let addresses):
                XCTAssertNotNil(addresses)
                addressesArray = addresses
                print(addresses.count)
                addressExpectation.fulfill()
            case .failure(let error):
                print(error)
            }
        }
        
        wait(for: [addressExpectation], timeout: 2)
        XCTAssertTrue(!addressesArray.isEmpty)
        let searchResult = addressesArray[0]
        XCTAssertEqual(1145.0453667693146, searchResult.distance, accuracy: 0.001)
        XCTAssertEqual("4052 Washington St, Weirton, WV 26062", searchResult.address)
        XCTAssertEqual(40.39222, searchResult.latitude, accuracy: 0.001)
        XCTAssertEqual(-80.5944, searchResult.longitude, accuracy: 0.001)
    }
}
