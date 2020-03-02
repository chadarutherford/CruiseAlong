//
//  Errors.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import Foundation

enum CANetworkError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case noData
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return NSLocalizedString("The URL was invalid, please try again.", comment: "Invalid URL")
        case .unableToComplete:
            return NSLocalizedString("Unable to complete your request, please check your internet connection.", comment: "Internet Connection Error")
        case .invalidResponse:
            return NSLocalizedString("Invalid response from the server, please try again.", comment: "Invalid Server Response")
        case .noData:
            return NSLocalizedString("The response returned from the server contained no data, or corrupt data", comment: "No Data Returned")
        }
    }
}
