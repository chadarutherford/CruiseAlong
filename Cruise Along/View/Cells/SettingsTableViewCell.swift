//
//  SettingsTableViewCell.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    static let reuseID = "SettingsCell"
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Home"
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Address"
        return label
    }()
    
    var address: Address?
//    {
//        didSet {
//            updateViews()
//        }
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        addSubview(iconImageView)
        addSubview(descriptionLabel)
        addSubview(detailLabel)
        backgroundColor = .darkGray
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            descriptionLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            descriptionLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -8),
            
            detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            detailLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            detailLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -8),
            detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    private func updateViews() {
        guard let address = address,
            let streetAddress = address.streetAddress,
            let city = address.city,
            let state = address.state,
            let zipCode = address.zipCode else { return }
        detailLabel.text = "\(streetAddress) \(city) \(state), \(zipCode)"
    }
}

