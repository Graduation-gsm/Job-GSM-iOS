//
//  JGTabBar.swift
//  job-gsm
//
//  Created by 선민재 on 2023/06/28.
//

import UIKit

final class JGTabBarViewController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureVC()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension JGTabBarViewController {
    func configureVC() {
        tabBar.unselectedItemTintColor = UIColor.g10
        tabBar.backgroundColor = UIColor.f20
    }
}
