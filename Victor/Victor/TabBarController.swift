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
    var searchTabNavigationController : UINavigationController!
    var uploadTabNavigationController: UINavigationController!
    var notificationsTabNavigationController : UINavigationController!
    var profileTabNavigationController : UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
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
        uploadTabNavigationController = UINavigationController.init(rootViewController: UploadViewController())
        notificationsTabNavigationController = UINavigationController.init(rootViewController: NotificationsViewController())
        profileTabNavigationController = UINavigationController.init(rootViewController: ProfileViewController())
        
        viewControllers = [homeTabNavigationController, searchTabNavigationController, uploadTabNavigationController, notificationsTabNavigationController, profileTabNavigationController]
        
        let item0 = UITabBarItem(title: "", image: UIImage(named: "home-white"), tag: 0)
        item0.selectedImage = UIImage(named: "home-black")
        
        let item1 = UITabBarItem(title: "", image: UIImage(named: "search"), tag: 1)
        item1.selectedImage = UIImage(named: "search-filled")
        
        let item2 = UITabBarItem(title: "", image: UIImage(named: "upload"), tag: 2)
        item2.selectedImage = UIImage(named: "upload-filled")
        
        let item3 = UITabBarItem(title: "", image: UIImage(named: "bell"), tag: 3)
        item3.selectedImage = UIImage(named: "bell-filled")
        
        let item4 = UITabBarItem(title: "", image: UIImage(named: "user-white"), tag: 4)
        item4.selectedImage = UIImage(named: "user-black")
        
        homeTabNavigationController.tabBarItem = item0
        searchTabNavigationController.tabBarItem = item1
        uploadTabNavigationController.tabBarItem = item2
        notificationsTabNavigationController.tabBarItem = item3
        profileTabNavigationController.tabBarItem = item4
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(of: viewController)
        
        if index == 2 {
            let vc =  UploadViewController()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
            return false
        }
      return true
    }
}

extension UITabBarController: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let profileVC = tabBarController.viewControllers?[4] as! UINavigationController
        profileVC.popViewController(animated: false)
    }
}
