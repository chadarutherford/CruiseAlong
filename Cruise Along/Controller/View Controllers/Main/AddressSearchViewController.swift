//
//  AddressSearchViewController.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreLocation
import UIKit

class AddressSearchViewController: UIViewController {
    
    let handleArea = UIView()
    let handleBar = UIView()
    let searchBar = UISearchBar()
    let tableView = UITableView()
    var apiController: APIController!
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var results = [SearchAddress]()
    let addressFetchQueue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewController()
        apiController = APIController()
    }
    
    private func configureUI() {
        view.addSubview(handleArea)
        handleArea.addSubview(handleBar)
        handleArea.backgroundColor = .systemBackground
        handleArea.accessibilityTraits = UIAccessibilityTraits.button
        handleArea.accessibilityIdentifier = "Handle"
        tableView.accessibilityIdentifier = "SearchTable"
        searchBar.searchTextField.accessibilityIdentifier = "SearchBar"
        handleBar.backgroundColor = .darkGray
        view.addSubview(searchBar)
        view.addSubview(tableView)
        handleArea.translatesAutoresizingMaskIntoConstraints = false
        handleBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            handleArea.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            handleArea.topAnchor.constraint(equalTo: view.topAnchor),
            handleArea.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            handleArea.heightAnchor.constraint(equalToConstant: 65),
            
            handleBar.centerYAnchor.constraint(equalTo: handleArea.centerYAnchor),
            handleBar.centerXAnchor.constraint(equalTo: handleArea.centerXAnchor),
            handleBar.heightAnchor.constraint(equalToConstant: 7),
            handleBar.widthAnchor.constraint(equalToConstant: 61),
            
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: handleArea.bottomAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    private func configureViewController() {
        searchBar.delegate = self
        searchBar.placeholder = "Search:"
        tableView.delegate = self
        tableView.dataSource = self
        handleBar.layer.cornerRadius = 3.5
        handleBar.layer.masksToBounds = true
        tableView.rowHeight = 60
        tableView.register(AddressTableViewCell.self, forCellReuseIdentifier: AddressTableViewCell.reuseID)
    }
    
    private func clearOutTableView() {
        results = []
        self.tableView.reloadData()
    }
}

extension AddressSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let term = searchBar.text,
            !term.isEmpty else { return }
        guard let location = location?.coordinate else { return }
        clearOutTableView()
        let fetchAddressOperation = FetchAddressesOperation(searchTerm: term, location: location, apiController: apiController)
        let completionOperation = BlockOperation {
            guard let addresses = fetchAddressOperation.addresses else { return }
            self.results = addresses
            self.tableView.reloadData()
        }
        
        completionOperation.addDependency(fetchAddressOperation)
        addressFetchQueue.addOperation(fetchAddressOperation)
        OperationQueue.main.addOperation(completionOperation)
        
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
}

extension AddressSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.reuseID, for: indexPath) as? AddressTableViewCell else { return UITableViewCell() }
        let result = results[indexPath.row]
        guard let location = location else { return UITableViewCell() }
        let distance = location.distance(from: CLLocation(latitude: result.latitude, longitude: result.longitude))
        let distanceString = FormatUtilities.formatDistance(meters: distance)
        cell.addressLabel.text = result.address
        cell.distanceLabel.text = distanceString
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = results[indexPath.row]
        let userInfo = ["address" : result.address]
        NotificationCenter.default.post(name: .addressWasSelected, object: self, userInfo: userInfo)
        clearOutTableView()
    }
}
