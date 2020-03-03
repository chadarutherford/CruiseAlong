//
//  FetchRouteOperation.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/3/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreLocation
import Foundation

class FetchRouteOperation: ConcurrentOperation {
    
    var apiController: APIController
    var destination: CLLocationCoordinate2D
    var origin: CLLocationCoordinate2D
    var route: Route?
    var error: Error?
    
    init(origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D, apiController: APIController) {
        self.origin = origin
        self.destination = destination
        self.apiController = apiController
    }
    
    override func start() {
        self.state = .isExecuting
        
        apiController.fetchRoutes(with: destination, origin: origin) { results in
            defer { self .state = .isFinished }
            switch results {
            case .success(let route):
                self.route = route
            case .failure(let error):
                self.error = error
            }
        }
    }
}
