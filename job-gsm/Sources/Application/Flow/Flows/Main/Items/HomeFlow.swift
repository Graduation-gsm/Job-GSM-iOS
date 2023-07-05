//
//  HomeFlow.swift
//  job-gsm
//
//  Created by 선민재 on 2023/06/28.
//

import RxFlow
import UIKit
import RxCocoa
import RxSwift

struct HomeStepper: Stepper{
    var steps = PublishRelay<Step>()

    var initialStep: Step{
        return JGStep.homeIsRequired
    }
}

class HomeFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    var stepper = HomeStepper()
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? JGStep else { return .none }
        switch step {
        case .homeIsRequired:
            return coordinateToHome()
            
        case .mouIsRequired:
            return .one(flowContributor: .forwardToParentFlow(withStep: JGStep.mouIsRequired))

        case .profileIsRequired:
            return .one(flowContributor: .forwardToParentFlow(withStep: JGStep.profileIsRequired))
            
        case .detailIsRequired:
            return coordinateToDetail()

        default:
            return .none
        }
    }
    
    private func coordinateToHome() -> FlowContributors {
        let vm = HomeViewModel()
        let vc = HomeViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func coordinateToDetail() -> FlowContributors {
        let vm = DetailViewModel()
        let vc = DetailViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
}
