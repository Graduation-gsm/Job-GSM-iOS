import UIKit
import RxSwift
import RxCocoa
import RxFlow

class BaseViewModel{
    let keychain = Keychain()
    var disposeBag = DisposeBag()
    var steps = PublishRelay<Step>()
}
