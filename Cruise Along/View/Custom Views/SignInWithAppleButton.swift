//
//  SignInWithAppleButton.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 2/28/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import AuthenticationServices
import UIKit

class SignInWithAppleButton: ASAuthorizationAppleIDButton {
    
    override init(authorizationButtonType type: ASAuthorizationAppleIDButton.ButtonType, authorizationButtonStyle style: ASAuthorizationAppleIDButton.Style) {
        super.init(authorizationButtonType: type, authorizationButtonStyle: style)
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
    }
}
