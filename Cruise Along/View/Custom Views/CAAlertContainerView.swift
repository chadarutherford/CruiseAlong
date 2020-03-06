//
//  CAAlertContainerView.swift
//  MapKitTutorial
//
//  Created by Chad Rutherford on 2/17/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import UIKit

class CAAlertContainerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
