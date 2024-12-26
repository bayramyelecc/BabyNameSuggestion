//
//  TabbarController.swift
//  BabyNameSuggestion
//
//  Created by Bayram Yeleç on 24.12.2024.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = MainVC()
        mainVC.tabBarItem.image = UIImage(systemName: "house")
        mainVC.tabBarItem.title = "İsimler"
        
        let settingsVC = SettingsVC()
        let navSettings = UINavigationController(rootViewController: settingsVC)
        settingsVC.tabBarItem.image = UIImage(systemName: "gear")
        settingsVC.tabBarItem.title = "İletişim"
        
        viewControllers = [mainVC, navSettings]
        tabBar.backgroundColor = .background
        tabBar.tintColor = .tabItem
    }
    
}
