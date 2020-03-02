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
    var workAddresses = [Address]()
    var homeAddresses = [Address]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchAddresses()
    }
    
    private func fetchAddresses() {
        let fetchRequest: NSFetchRequest<Address> = Address.fetchRequest()
        fetchRequest.sortDescriptors = [ NSSortDescriptor(key: "type", ascending: true) ]
        let moc = CoreDataCloudKitStack.shared.mainContext
        do {
            let results = try moc.fetch(fetchRequest)
            self.workAddresses = results.filter { $0.type == "Work" }
            self.homeAddresses = results.filter { $0.type == "Home" }
            self.tableView.reloadData()
        } catch {
            self.presentCAAlertOnMainThread(title: "Error", message: "Error fetching addresses", buttonTitle: "Ok")
        }
    }
    
    private func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.reuseID)
        tableView.separatorStyle = .none
        tableView.rowHeight = 84
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
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseID, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        guard let homeAddress = homeAddresses.first, let workAddress = workAddresses.first else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            cell.isUserInteractionEnabled = false
            cell.detailLabel.text = homeAddress.name
        case 1:
            cell.address = homeAddress
        case 2:
            cell.address = workAddress
        default:
            cell.detailLabel.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.handleMenuToggle()
        switch indexPath.row {
        case 1:
            guard let address = homeAddresses.first else { return }
            let userInfo = ["address" : address]
            NotificationCenter.default.post(name: .addressWasSelected, object: self, userInfo: userInfo)
        case 2:
            guard let address = workAddresses.first else { return }
            let userInfo = ["address" : address]
            NotificationCenter.default.post(name: .addressWasSelected, object: self, userInfo: userInfo)
        default:
            break
        }
    }
}
