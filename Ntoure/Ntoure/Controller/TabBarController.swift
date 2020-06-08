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

        let firstViewController = ExplorerViewController()
        let secondViewController = GuideViewController()
        
        let tabBarList = [firstViewController, secondViewController]
        viewControllers = tabBarList
        
    }


}
