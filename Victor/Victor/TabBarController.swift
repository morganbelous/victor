//
//  TabBarController.swift
//  Victor
//
//  Created by Morgan Belous on 8/18/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    var homeTabNavigationController : UINavigationController!
    var profileTabNavigationController : UINavigationController!
    var searchTabNavigationController : UINavigationController!
    var notificationsTabNavigationController : UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        tabBar.layer.shadowRadius = 5
        tabBar.layer.shadowOpacity = 0.8
        tabBar.layer.masksToBounds = false
        
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        homeTabNavigationController = UINavigationController.init(rootViewController: HomeViewController())
        searchTabNavigationController = UINavigationController.init(rootViewController: SearchViewController())
        notificationsTabNavigationController = UINavigationController.init(rootViewController: NotificationsViewController())
        profileTabNavigationController = UINavigationController.init(rootViewController: ProfileViewController())
        
        viewControllers = [homeTabNavigationController, searchTabNavigationController, notificationsTabNavigationController, profileTabNavigationController]
        
        let item1 = UITabBarItem(title: "", image: UIImage(named: "home-white"), selectedImage: UIImage(named: "home-black"))
        let item2 = UITabBarItem(title: "", image: UIImage(named: "search"), selectedImage: UIImage(named: "search-filled"))
        let item3 = UITabBarItem(title: "", image: UIImage(named: "bell"), selectedImage: UIImage(named: "bell-filled"))
         let item4 = UITabBarItem(title: "", image: UIImage(named: "user-white"), selectedImage: UIImage(named: "user-black"))
        
        homeTabNavigationController.tabBarItem = item1
        searchTabNavigationController.tabBarItem = item2
        notificationsTabNavigationController.tabBarItem = item3
        profileTabNavigationController.tabBarItem = item4
        
    }
    
    
    
}
