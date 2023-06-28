//
//  TabBarFlow.swift
//  job-gsm
//
//  Created by 선민재 on 2023/06/28.

import RxFlow
import UIKit

final class TabBarFlow: Flow {
    
    enum TabIndex: Int {
        case mou = 0
        case home = 1
        case profile = 2
    }
    
    var root: Presentable {
        return self.rootVC
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    private let rootVC = JGTabBarViewController()
    
    private var mouFlow = MOUFlow()
    private var homeFlow = HomeFlow()
    private var profileFlow = ProfileFlow()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? JGStep else {return .none}
        
        switch step {
        case .tabBarIsRequired:
            return coordinateToTabbar()
            
        default:
            return .none
        }
    }
    
}

private extension TabBarFlow {
    func coordinateToTabbar() -> FlowContributors {
        Flows.use(
            mouFlow, homeFlow, profileFlow,
            when: .ready
        ) { [unowned self] (root1: UINavigationController,
                            root2: UINavigationController,
                            root3: UINavigationController) in            
            let mouItem = UITabBarItem(
                title: "MOU",
                image: UIImage(named: "UnMOU.svg"),
                selectedImage: UIImage(named: "MOU.svg")
            )
            
            let homeItem = UITabBarItem(
                title: "채용공고",
                image: UIImage(named: "UnHome.svg"),
                selectedImage: UIImage(named: "Home.svg")
            )
            
            let profileItem = UITabBarItem(
                title: "프로필",
                image: UIImage(named: "UnProfile.svg"),
                selectedImage: UIImage(named: "Profile.svg")
            )
            root1.tabBarItem = mouItem
            root2.tabBarItem = homeItem
            root3.tabBarItem = profileItem
            
            self.rootVC.setViewControllers([root1,root2,root3], animated: true)
            self.rootVC.selectedIndex = 1

        }
        return .multiple(flowContributors: [
            .contribute(withNextPresentable: mouFlow, withNextStepper: mouFlow.stepper),
            .contribute(withNextPresentable: homeFlow, withNextStepper: homeFlow.stepper),
            .contribute(withNextPresentable: profileFlow, withNextStepper: profileFlow.stepper)
        ])
    }
}

