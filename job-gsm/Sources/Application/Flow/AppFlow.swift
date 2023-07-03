import RxFlow
import UIKit
import RxSwift
import RxCocoa

struct AppStepper: Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {}
    
    var initialStep: Step {
        return JGStep.onBoardingIsRequired
    }
}

final class AppFlow: Flow {
    
    var root: Presentable {
        return window
    }
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
        
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? JGStep else {return .none}
        
        switch step {
        case .onBoardingIsRequired:
            return coordinateToIntro()
        case .tabBarIsRequired:
            return coordinateToTabBar()
        default:
            return .none
        }
    }
    
    private func coordinateToIntro() -> FlowContributors {
        let flow = OnBoardingFlow()
        Flows.use(flow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(
            flowContributor: .contribute(
                withNextPresentable: flow,
                withNextStepper: OneStepper(withSingleStep: JGStep.onBoardingIsRequired)
        ))
    }
    
    private func coordinateToTabBar() -> FlowContributors {
        let flow = TabBarFlow()
        Flows.use(flow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(
            flowContributor: .contribute(
                withNextPresentable: flow,
                withNextStepper: OneStepper(withSingleStep: JGStep.tabBarIsRequired)
        ))
    }
}
