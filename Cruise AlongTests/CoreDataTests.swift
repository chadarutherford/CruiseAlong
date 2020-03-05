//
//  CoreDataTests.swift
//  Cruise AlongTests
//
//  Created by Chad Rutherford on 3/4/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreData
import XCTest
@testable import Cruise_Along

class CoreDataTests: XCTestCase {
    
    func testEntry() {
        let address = Address(name: "Chad", streetAddress: "123 Boring St", city: "Blahville", state: "NM", zipCode: "56783", type: .home)
        XCTAssertNotNil(address)
        try! CoreDataCloudKitStack.shared.mainContext.save()
        let fetchRequest: NSFetchRequest<Address> = Address.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", "Chad")
        guard let newAddress = try! CoreDataCloudKitStack.shared.mainContext.fetch(fetchRequest).first else { return }
        XCTAssertNotNil(newAddress)
        CoreDataCloudKitStack.shared.mainContext.delete(newAddress)
        try! CoreDataCloudKitStack.shared.mainContext.save()
    }
    
    func testStack() {
        let stack = CoreDataCloudKitStack.shared
        XCTAssertNotNil(stack.mainContext)
        XCTAssertNotNil(stack.container)
        let context = stack.backgroundContext
        XCTAssertNotNil(context)
    }
}
