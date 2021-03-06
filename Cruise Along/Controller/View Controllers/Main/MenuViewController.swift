//
//  MenuViewController.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreData
import UIKit

class MenuViewController: UIViewController {
    
    var tableView: UITableView!
    weak var delegate: RoutingViewControllerDelegate?
    var homeAddresses = [Address]()
    var workAddresses = [Address]()
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Loaded")
        configureTableView()
        fetchAddresses()
    }
    
    private func fetchAddresses() {
        let fetchRequest: NSFetchRequest<Address> = Address.fetchRequest()
        fetchRequest.sortDescriptors = [ NSSortDescriptor(key: "type", ascending: true) ]
        let moc = CoreDataCloudKitStack.shared.mainContext
        do {
            let results = try moc.fetch(fetchRequest)
            self.homeAddresses = results.filter { $0.type == "Home" }
            self.workAddresses = results.filter { $0.type == "Work" }
            tableView.reloadData()
        } catch {
            self.presentCAAlertOnMainThread(title: "Error", message: "Error fetching addresses", buttonTitle: "Ok")
        }
    }
    
    private func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.accessibilityIdentifier = "Menu"
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.reuseID)
        tableView.separatorStyle = .none
        tableView.rowHeight = 84
        tableView.estimatedRowHeight = 84
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .darkGray
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseID, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        let homeAddress = homeAddresses[0]
        let workAddress = workAddresses[0]
        if indexPath.row == 0 {
            cell.isUserInteractionEnabled = false
            cell.detailLabel.text = homeAddress.name
        } else if indexPath.row == 1 {
            cell.address = homeAddress
        } else if indexPath.row == 2 {
            cell.address = workAddress
        } else {
            cell.detailLabel.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.handleMenuToggle()
        if indexPath.row == 1 {
            let address = homeAddresses[0]
            let userInfo = ["address" : address]
            NotificationCenter.default.post(name: .addressWasSelected, object: self, userInfo: userInfo)
        } else if indexPath.row == 2 {
            let address = workAddresses[0]
            let userInfo = ["address" : address]
            NotificationCenter.default.post(name: .addressWasSelected, object: self, userInfo: userInfo)
        } else if indexPath.row == 3 {
            NotificationCenter.default.post(name: .logOutButtonSelected, object: self)
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true)
        }
    }
}
