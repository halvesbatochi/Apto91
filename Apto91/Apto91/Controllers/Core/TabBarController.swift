//
//  TabBarController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 08/06/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabs()
    }
    
    private func setUpTabs() {
        let homeVC = HomeViewController()
        let budgetVC = BudgetViewController()
        let sharedItensVC = SharedItensViewController()
        let profileVC = ProfileViewController()
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        budgetVC.navigationItem.largeTitleDisplayMode = .always
        sharedItensVC.navigationItem.largeTitleDisplayMode = .always
        profileVC.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: budgetVC)
        let nav3 = UINavigationController(rootViewController: sharedItensVC)
        let nav4 = UINavigationController(rootViewController: profileVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Home",
                                       image: UIImage(systemName: "house.fill"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Orçamento",
                                       image: UIImage(systemName: "dollarsign.circle.fill"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Compartilhado",
                                       image: UIImage(systemName: "list.bullet.clipboard.fill"),
                                       tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Perfil",
                                       image: UIImage(systemName: "person.crop.circle.fill"),
                                       tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2, nav3, nav4],
                           animated: true)
    }
}
