//
//  FetchAddressesOperation.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/3/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreLocation
import Foundation

class FetchAddressesOperation: ConcurrentOperation {
    
    var addresses: [SearchAddress]?
    var error: Error?
    var apiController: APIController
    var searchTerm: String
    var location: CLLocationCoordinate2D
    
    init(searchTerm: String, location: CLLocationCoordinate2D, apiController: APIController) {
        self.apiController = apiController
        self.searchTerm = searchTerm
        self.location = location
    }
    
    override func start() {
        self.state = .isExecuting
        apiController.fetchAddresses(with: searchTerm, location: location) { results in
            defer { self.state = .isFinished }
            switch results {
            case .success(let addresses):
                self.addresses = addresses
            case .failure(let error):
                self.error = error
            }
        }
    }
}
