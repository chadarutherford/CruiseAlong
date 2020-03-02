//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/7/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import SafariServices
import UIKit

extension UIViewController {
    func presentCAAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = CAAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
