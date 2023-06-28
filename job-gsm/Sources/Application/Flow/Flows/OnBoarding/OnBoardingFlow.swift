import RxFlow
import UIKit

class OnBoardingFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? JGStep else { return .none }
        switch step {
        case .onBoardingIsRequired:
            return coordinateToOnBoarding()
        case .insertInfoIsRequired:
            return coordinateInsertInfo()
        default:
            return .none
        }
    }
}

private extension OnBoardingFlow {
    private func coordinateToOnBoarding() -> FlowContributors {
        let vm = OnBoardingViewModel()
        let vc = OnBoardingViewController()
        self.rootViewController.setViewControllers([vc], animated: false)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func coordinateInsertInfo() -> FlowContributors {
        let vm = InsertInfoViewModel()
        let vc = InsertInfoViewController()
        self.rootViewController.pushViewController(vc, animated: false)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
}
