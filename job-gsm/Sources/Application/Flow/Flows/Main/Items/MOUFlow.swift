//
//  MOUFlow.swift
//  job-gsm
//
//  Created by 선민재 on 2023/06/28.
//

import RxFlow
import UIKit
import RxCocoa
import RxSwift

struct MOUStepper: Stepper{
    var steps = PublishRelay<Step>()

    var initialStep: Step{
        return JGStep.mouIsRequired
    }
}

class MOUFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    var stepper = MOUStepper()
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? JGStep else { return .none }
        switch step {
        case .mouIsRequired:
            return coordinateToMOU()

        default:
            return .none
        }
    }
    
    private func coordinateToMOU() -> FlowContributors {
        let vm = MOUViewModel()
        let vc = MOUViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
}
