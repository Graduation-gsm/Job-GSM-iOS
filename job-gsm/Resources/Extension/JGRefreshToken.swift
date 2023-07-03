import Foundation
import Moya
import UIKit
import RxFlow
import RxCocoa

class JGRefreshToken {
    static let shared = JGRefreshToken()
    var steps = PublishRelay<Step>()
    var statusCode: Int = 0
    private let authProvider = MoyaProvider<AuthServices>()
    private var reissuanceData: RefreshTokenResponse?
    private let keychain = Keychain()
    private lazy var refreshToken = "Bearer " + (keychain.read(key: Const.KeychainKey.refreshToken) ?? "")
    
    private init() {}

    func tokenReissuance() {
        authProvider.request(.refresh(refreshToken: refreshToken)) { response in
            switch response {
            case .success(let result):
                self.statusCode = result.statusCode
                do {
                    self.reissuanceData = try result.map(RefreshTokenResponse.self)
                }catch(let err) {
                    print(String(describing: err))
                }
                switch self.statusCode {
                case 200..<300:
                    self.updateKeychainToken()
                case 400, 401, 404:
                    self.steps.accept(JGStep.onBoardingIsRequired)
                default:
                    self.steps.accept(JGStep.onBoardingIsRequired)
                }
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
    
    func autoLogin(completion: @escaping () -> Void) {
        authProvider.request(.refresh(refreshToken: refreshToken)) { response in
            switch response {
            case .success(let result):
                self.statusCode = result.statusCode
                completion()
                do {
                    self.reissuanceData = try result.map(RefreshTokenResponse.self)
                }catch(let err) {
                    print(String(describing: err))
                }
                switch self.statusCode {
                case 200..<300:
                    self.updateKeychainToken()
                default: break;
                }
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
    
    func updateKeychainToken() {
        self.keychain.updateItem(
            token: self.reissuanceData?.accessToken ?? "",
            key: Const.KeychainKey.accessToken
        )
        self.keychain.updateItem(
            token: self.reissuanceData?.refreshToken ?? "",
            key: Const.KeychainKey.refreshToken
        )
    }
}

