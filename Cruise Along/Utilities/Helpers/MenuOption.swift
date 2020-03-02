//
//  MenuOption.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case profile
    case homeAddress
    case workAddress
    case logout
    
    var description: String {
        switch self {
        case .profile: return "Profile"
        case .homeAddress: return "Home Address"
        case .workAddress: return "Work Address"
        case .logout: return "Log Out"
        }
    }
    
    var image: UIImage {
        switch self {
        case .profile: return UIImage(systemName: Images.profile) ?? UIImage()
        case .homeAddress: return UIImage(systemName: Images.homeAddress) ?? UIImage()
        case .workAddress: return UIImage(systemName: Images.workAddress) ?? UIImage()
        case .logout: return UIImage(systemName: Images.logout) ?? UIImage()
        }
    }
}
