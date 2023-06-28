import Foundation
import RxFlow
import RxCocoa
import RxSwift

class InsertInfoViewModel: BaseViewModel, Stepper{

    struct Input {
        let buttonDidTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.buttonDidTap.subscribe(
            onNext: pushStudentInfo
        ) .disposed(by: disposeBag)
    }

    private func pushStudentInfo() {
        self.steps.accept(JGStep.tabBarIsRequired)
    }
}
