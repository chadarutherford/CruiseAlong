//
//  SceneDelegate.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 3/1/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        if UserDefaults.standard.string(forKey: UserDefaultsKeys.userIdKey) == nil {
            let loginVC = LoginViewController()
            window?.rootViewController = loginVC
            window?.makeKeyAndVisible()
        } else {
            let containerVC = ContainerViewController()
            window?.rootViewController = containerVC
            window?.makeKeyAndVisible()
        }
    }
}
