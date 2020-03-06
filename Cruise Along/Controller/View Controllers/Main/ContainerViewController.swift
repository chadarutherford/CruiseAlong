//
//  ContainerViewController.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: -  Properties
    var menuController: MenuViewController!
    var centerController: UINavigationController!
    var isExpanding = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        self.view.isUserInteractionEnabled = true
        configureRoutingController()
    }
    
    private func configureRoutingController() {
        let routingController = RoutingViewController()
        routingController.delegate = self
        centerController = UINavigationController(rootViewController: routingController)
        centerController.view.isUserInteractionEnabled = true
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func animatePanel(shouldExpand: Bool) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            })
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            })
        }
    }
    
    private func configureMenuController() {
        if menuController == nil {
            menuController = MenuViewController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
}

extension ContainerViewController: RoutingViewControllerDelegate {
    func handleMenuToggle() {
        if !isExpanding {
            configureMenuController()
        }
        isExpanding.toggle()
        animatePanel(shouldExpand: isExpanding)
    }
}
