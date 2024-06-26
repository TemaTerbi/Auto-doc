//
//  SceneDelegate.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = ViewController()
        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.navigationBar.tintColor = .black
        window?.rootViewController = navigationViewController
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
    }
}

