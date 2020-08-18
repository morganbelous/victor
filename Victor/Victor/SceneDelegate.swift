//
//  SceneDelegate.swift
//  Victor
//
//  Created by Morgan Belous on 8/17/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var homeTabNavigationController : UINavigationController!
    var profileTabNavigationController : UINavigationController!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let tabBarController = UITabBarController()
        
        homeTabNavigationController = UINavigationController.init(rootViewController: HomeViewController())
        profileTabNavigationController = UINavigationController.init(rootViewController: ProfileViewController())
        
        tabBarController.viewControllers = [homeTabNavigationController, profileTabNavigationController]
        
        tabBarController.tabBar.barTintColor = .white
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBarController.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        tabBarController.tabBar.layer.shadowRadius = 5
        tabBarController.tabBar.layer.shadowOpacity = 0.8
        tabBarController.tabBar.layer.masksToBounds = false
        
        let item1 = UITabBarItem(title: "", image: UIImage(named: "home-white"), selectedImage: UIImage(named: "home-black"))
        let item2 = UITabBarItem(title: "", image: UIImage(named: "user-white"), selectedImage: UIImage(named: "user-black"))
        
        homeTabNavigationController.tabBarItem = item1
        profileTabNavigationController.tabBarItem = item2
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = tabBarController
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

