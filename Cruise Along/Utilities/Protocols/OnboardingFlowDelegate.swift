//
//  OnboardingFlowDelegate.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/3/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import Foundation

protocol OnboardingFlowDelegate: AnyObject {
    func didLogIn(with name: String)
}
