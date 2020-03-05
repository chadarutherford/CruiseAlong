//
//  Cruise_AlongUITests.swift
//  Cruise AlongUITests
//
//  Created by Chad Rutherford on 3/1/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import XCTest

class Cruise_AlongUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testMenuControllerForHomeAddress() {
        let button = app.buttons["Settings"]
        button.tap()
        let table = app.tables["Menu"]
        let homeCell = table.cells.staticTexts["Home Address"]
        let homeAddress = table.cells.staticTexts["123 Boring St Blahville CA, 56473"]
        XCTAssertNotNil(table)
        XCTAssert(homeCell.exists)
        XCTAssert(homeAddress.exists)
    }
    
    func testMenuControllerForWorkAddress() {
        let button = app.buttons["Settings"]
        button.tap()
        let table = app.tables["Menu"]
        let homeCell = table.cells.staticTexts["Work Address"]
        let homeAddress = table.cells.staticTexts["456 Workaholic Ln Industry MA, 67890"]
        XCTAssertNotNil(table)
        XCTAssert(homeCell.exists)
        XCTAssert(homeAddress.exists)
    }
    
    func testOpenAndCloseMenuController() {
        let button = app.buttons["Settings"]
        button.tap()
        let table = app.tables["Menu"]
        XCTAssertNotNil(table)
        XCTAssert(table.exists)
        button.tap()
        XCTAssertFalse(table.isHittable)
    }
    
    func testOpenSearchController() {
        let button = app.buttons["Handle"]
        button.tap()
        let table = app.tables["SearchTable"]
        let searchBar = app.searchFields["SearchBar"]
        XCTAssert(table.exists)
        XCTAssert(searchBar.exists)
    }
    
    func testCloseSearchController() {
        let button = app.buttons["Handle"]
        button.tap()
        let table = app.tables["SearchTable"]
        let searchBar = app.searchFields["SearchBar"]
        XCTAssert(table.exists)
        XCTAssert(searchBar.exists)
        button.tap()
        XCTAssertFalse(table.isHittable)
        XCTAssertFalse(searchBar.isHittable)
    }
}
