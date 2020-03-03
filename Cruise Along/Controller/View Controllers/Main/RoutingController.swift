//
//  RoutingController.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

class RoutingViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    let mapView = MKMapView()
    var apiController: APIController!
    let settingsButton = CASettingsButton()
    weak var delegate: RoutingViewControllerDelegate?
    var location: CLLocation?
    let locationManager = CLLocationManager()
    var addressSearchViewController: AddressSearchViewController!
    var visualEffectView: UIVisualEffectView!
    let cardHeight: CGFloat = 700
    let cardHandleAreaHeight: CGFloat = 65
    let regionInMeters: Double = 1_000
    var isCardVisible  = false
    var nextState: CardState {
        isCardVisible ? .collapsed : .expanded
    }
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted: CGFloat = 0
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupCard()
        setupAddressObservers()
        checkLocationServices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - UI Configuration
    private func configureUI() {
        view.addSubview(mapView)
        mapView.frame = CGRect.zero
        view.addSubview(settingsButton)
        mapView.delegate = self
        mapView.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            settingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        ])
        apiController = APIController()
    }
    
    private func setupCard() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        addressSearchViewController = AddressSearchViewController()
        addressSearchViewController.location = location
        self.addChild(addressSearchViewController)
        view.addSubview(addressSearchViewController.view)
        addressSearchViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
        addressSearchViewController.view.clipsToBounds = true
        addressSearchViewController.view.layer.cornerRadius = 15
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(_:)))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(_:)))
        addressSearchViewController.handleArea.addGestureRecognizer(tapGesture)
        addressSearchViewController.handleArea.addGestureRecognizer(panGesture)
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    
    private func setupAddressObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleAddressNotification(_:)), name: .addressWasSelected, object: nil)
    }
    
    @objc private func settingsButtonTapped() {
        delegate?.handleMenuToggle()
    }
    
    @objc private func handleCardTap(_ recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    @objc private func handleCardPan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            let translation = recognizer.translation(in: self.addressSearchViewController.handleArea)
            var fractionComplete = translation.y / cardHeight
            fractionComplete = isCardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
    }
    
    @objc private func handleAddressNotification(_ notification: NSNotification) {
        let geocoder = CLGeocoder()
        if let address = notification.userInfo?["address"] as? Address {
            print(address)
        } else if let address = notification.userInfo?["address"] as? String {
            if let userLocation = locationManager.location {
                geocoder.geocodeAddressString(address) { placemarks, error in
                    guard error == nil else { return }
                    guard let placemarks = placemarks, let location = placemarks.first?.location else { return }
                    self.apiController.fetchRoutes(with: location.coordinate, origin: userLocation.coordinate) { results in
                        switch results {
                        case .success(let route):
                            self.addPolylineToMap(with: route)
                        case .failure(let error):
                            self.presentCAAlertOnMainThread(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
                        }
                    }
                }
            }
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        }
    }
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Animations
    private func animateTransitionIfNeeded(state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.addressSearchViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                    self.mapView.addSubview(self.visualEffectView)
                case .collapsed:
                    self.addressSearchViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                    self.visualEffectView.removeFromSuperview()
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.isCardVisible.toggle()
                self.runningAnimations.removeAll()
            }
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.visualEffectView.effect = UIBlurEffect(style: .dark)
                case .collapsed:
                    self.visualEffectView.effect = nil
                }
            }
            
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
        }
    }
    
    private func startInteractiveTransition(state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    private func updateInteractiveTransition(fractionCompleted: CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    private func continueInteractiveTransition() {
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Location
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
            setupLocationManager()
        } else {
            presentCAAlertOnMainThread(title: "Error", message: "Please ensure location services are enabled on your device", buttonTitle: "Ok")
        }
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func centerViewOnUserLocation(with meters: Double) {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: meters, longitudinalMeters: meters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            centerViewOnUserLocation(with: regionInMeters)
            mapView.showsUserLocation = true
        case .denied:
            self.presentCAAlertOnMainThread(title: "Error", message: "You have denied permissions for location services. Please enable them and return to the app.", buttonTitle: "Ok")
        case .restricted:
            self.presentCAAlertOnMainThread(title: "Error", message: "You have parental controls set up that prevent location services", buttonTitle: "Ok")
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    func addPolylineToMap(with route: Route) {
        let coordinates = route.points.map { CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude) }
        let locationCount = coordinates.count
        let geodesic = MKGeodesicPolyline(coordinates: coordinates, count: locationCount)
        mapView.addOverlay(geodesic)
        setVisibleMapArea(with: geodesic, edgeInsets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), animated: true)
        self.mapView.setUserTrackingMode(.follow, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.centerViewOnUserLocation(with: 100)
        }
    }
    
    func setVisibleMapArea(with polyline: MKPolyline, edgeInsets: UIEdgeInsets, animated: Bool = false) {
        mapView.setVisibleMapRect(polyline.boundingMapRect, edgePadding: edgeInsets, animated: animated)
    }
}

extension RoutingViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            addressSearchViewController.location = location
            self.location = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let pr = MKPolylineRenderer(overlay: overlay)
            pr.strokeColor = UIColor.systemBlue.withAlphaComponent(0.5)
            pr.lineWidth = 5
            return pr
        }
        return MKOverlayRenderer()
    }
}
