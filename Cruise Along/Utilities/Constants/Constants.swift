//
//  Constants.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import Foundation

enum Images {
    static let profile = "person"
    static let homeAddress = "house"
    static let workAddress = "briefcase"
    static let logout = "arrow.left.square"
    static let background = "onboardingBackground"
    static let motorcycle = "motorcycle"
}

enum APIKeys {
    static let baseAddressURL = "https://api.tomtom.com/search/2/search/"
    static let apiKey = "9fAquYIwQ4Aj3NRv3U28jM60VhBID1vR"
    static let baseRouteURL = "https://api.tomtom.com/routing/1/calculateRoute"
}

enum UserDefaultsKeys {
    static let userIdKey = "UserID"
}
