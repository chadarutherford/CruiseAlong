//
//  CASettingsButton.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 2/27/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import UIKit

class CASettingsButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setImage(UIImage(systemName: "gear"), for: .normal)
        tintColor = .white
        setPreferredSymbolConfiguration(.init(font: UIFont.systemFont(ofSize: 30)), forImageIn: .normal)
        layer.shadowColor = UIColor.black.withAlphaComponent(0.75).cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 1.0
    }
}
