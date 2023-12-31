import Foundation
import RxFlow
import RxCocoa
import RxSwift
import Moya

class OnBoardingViewModel: BaseViewModel, Stepper{
    let authProvider = MoyaProvider<AuthServices>()
    var authData: SignInResponse?

    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
    }

}

extension OnBoardingViewModel {
    func gauthSignInCompleted(code: String) {
        let param = SignInRequest(code: code)
        authProvider.request(.signIn(param: param)) { response in
            switch response {
            case .success(let result):
                print(String(data: result.data, encoding: .utf8))
                do {
                    self.authData = try result.map(SignInResponse.self)
                }catch(let err) {
                    print(String(describing: err))
                }
                let statusCode = result.statusCode
                print(statusCode)
                switch statusCode{
                case 200..<300:
                    self.addKeychainToken()
                    if self.authData?.isExist == false {
                        self.steps.accept(JGStep.insertInfoIsRequired)
                    }
                    else {
                        self.steps.accept(JGStep.tabBarIsRequired)
                    }
                case 400: break
                default:
                    print("ERROR")
                }
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
    
    func addKeychainToken() {
        self.keychain.create(
            key: Const.KeychainKey.accessToken,
            token: self.authData?.accessToken ?? ""
        )
        self.keychain.create(
            key: Const.KeychainKey.refreshToken,
            token: self.authData?.refreshToken ?? ""
        )
    }
}
