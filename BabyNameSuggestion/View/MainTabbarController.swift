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
        let navMain = UINavigationController(rootViewController: mainVC)
        mainVC.tabBarItem.image = UIImage(systemName: "stroller.fill")
        mainVC.tabBarItem.title = "İsimler"
        
        let settingsVC = SettingsVC()
        let navSettings = UINavigationController(rootViewController: settingsVC)
        settingsVC.tabBarItem.image = UIImage(systemName: "gear")
        settingsVC.tabBarItem.title = "Ayarlar"
        
        viewControllers = [navMain, navSettings]
        tabBar.backgroundColor = .systemGray6
        tabBar.tintColor = .tabItem
    }
    
}
