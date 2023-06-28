//
//  ProfileFlow.swift
//  job-gsm
//
//  Created by 선민재 on 2023/06/28.
//

import RxFlow
import UIKit
import RxCocoa
import RxSwift

struct ProfileStepper: Stepper{
    var steps = PublishRelay<Step>()

    var initialStep: Step{
        return JGStep.profileIsRequired
    }
}

class ProfileFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    var stepper = ProfileStepper()
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? JGStep else { return .none }
        switch step {
        case .profileIsRequired:
            return coordinateToProfile()

        default:
            return .none
        }
    }
    
    private func coordinateToProfile() -> FlowContributors {
        let vm = ProfileViewModel()
        let vc = ProfileViewController()
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
}
