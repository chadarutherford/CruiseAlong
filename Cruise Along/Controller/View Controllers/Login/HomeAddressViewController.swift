//
//  HomeAddressViewController.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/3/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreData
import UIKit

class HomeAddressViewController: UIViewController {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text = "Hi <NAME>!"
        label.textColor = .label
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Let's start with your home address:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    let addressTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Street Address:"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let cityTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "City:"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let stateTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "State:"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let zipCodeTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Zip Code:"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let instructionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Please enter your address, with only\n a 2 letter state for example: CA"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    let topLevelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 15
        return stackView
    }()
    
    let innerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 47
        return stackView
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    var textFields = [UITextField]()
    
    var name: String? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureUI()
    }
    
    private func configureTextFields() {
        textFields = [addressTextField, cityTextField, stateTextField, zipCodeTextField]
        for textField in textFields {
            textField.delegate = self
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .systemTeal
        view.addSubview(nameLabel)
        view.addSubview(titleLabel)
        view.addSubview(topLevelStackView)
        topLevelStackView.addArrangedSubview(addressTextField)
        topLevelStackView.addArrangedSubview(cityTextField)
        topLevelStackView.addArrangedSubview(innerStackView)
        innerStackView.addArrangedSubview(stateTextField)
        innerStackView.addArrangedSubview(zipCodeTextField)
        view.addSubview(instructionsLabel)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 95),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            topLevelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 51),
            topLevelStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -51),
            topLevelStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            
            addressTextField.heightAnchor.constraint(equalToConstant: 40),
            cityTextField.heightAnchor.constraint(equalToConstant: 40),
            stateTextField.heightAnchor.constraint(equalToConstant: 40),
            zipCodeTextField.heightAnchor.constraint(equalToConstant: 40),
            stateTextField.widthAnchor.constraint(equalToConstant: 60),
            
            instructionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instructionsLabel.topAnchor.constraint(equalTo: topLevelStackView.bottomAnchor, constant: 8),
            
            nextButton.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalTo: nextButton.widthAnchor, multiplier: 0.33),
        ])
    }
    
    @objc private func nextButtonTapped() {
        
    }
}

extension HomeAddressViewController: UITextFieldDelegate {
    
}