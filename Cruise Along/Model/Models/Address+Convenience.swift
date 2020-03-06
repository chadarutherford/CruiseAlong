//
//  Address+Convenience.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CloudKit
import CoreData
import Foundation

extension Address {
    @discardableResult convenience init?(name: String,
                                         streetAddress: String,
                                         city: String,
                                         state: String,
                                         zipCode: String,
                                         type: AddressType,
                                         context: NSManagedObjectContext = CoreDataCloudKitStack.shared.mainContext) {
        self.init(context: context)
        self.name = name
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.type = type.rawValue
    }
}
