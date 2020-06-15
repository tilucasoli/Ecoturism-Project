//
//  TabBarController.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 08/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let explorer = UINavigationController(rootViewController: ExplorerViewController())
        explorer.tabBarItem = UITabBarItem(title: "Explorar", image: UIImage(named: "compass"), tag: 0)

        let guide = UINavigationController(rootViewController: GuideViewController())
        guide.tabBarItem = UITabBarItem(title: "Roteiros", image: UIImage(named: "Roteiros"), tag: 1)

        let tabBarList = [explorer, guide]
        viewControllers = tabBarList

        setupStyle()
        removeSeparator()
    }

    func setupStyle() {
        // general style
        tabBar.tintColor = .actionColor
        tabBar.backgroundColor = .white

        //shadow setup
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowRadius = 6
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowOpacity = 0.05

    }

    func removeSeparator() {
        if #available(iOS 13, *) {
            // iOS 13:
            let appearance = tabBar.standardAppearance
            appearance.configureWithOpaqueBackground()
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            tabBar.standardAppearance = appearance
        } else {
            // iOS 12 and below:
            tabBar.shadowImage = UIImage()
            tabBar.backgroundImage = UIImage()
        }
    }
}
