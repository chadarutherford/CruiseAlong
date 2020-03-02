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
    let settingsButton = CASettingsButton()
    weak var delegate: RoutingViewControllerDelegate?
    var location: CLLocation?
    let locationManager = CLLocationManager()
    var addressSearchViewController: AddressSearchViewController!
    var visualEffectView: UIVisualEffectView!
    let cardHeight: CGFloat = 700
    let cardHandleAreaHeight: CGFloat = 65
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configureUI() {
        view.addSubview(mapView)
        mapView.addSubview(settingsButton)
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
    }
    
    private func setupCard() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        self.mapView.addSubview(visualEffectView)
        addressSearchViewController = AddressSearchViewController()
        addressSearchViewController.location = locationManager.location
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
    
    private func animateTransitionIfNeeded(state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.addressSearchViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                case .collapsed:
                    self.addressSearchViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
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
}

extension RoutingViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
