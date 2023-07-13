import Foundation
import RxFlow
import RxCocoa
import RxSwift
import Moya

class ProfileViewModel: BaseViewModel, Stepper{
    let provider = MoyaProvider<AccountServices>(plugins: [NetworkLoggerPlugin()])
    var userData: ProfileResponse?
    
    struct Input {
        
    }
    
    struct Output {

    }
    
    func transform(input: Input) {
        
    }
    
}

extension ProfileViewModel {
    func fetchProfile(completion: @escaping () -> Void) {
        provider.request(.profile(authorization: accessToken)) { response in
            switch response {
            case let .success(result):
                let responseData = result.data
                print(String(data: responseData, encoding: .utf8))
                do {
                    self.userData = try JSONDecoder().decode(ProfileResponse.self, from: responseData)
                } catch {
                    print("Error parsing search student response: \(error)")
                }
                completion()
                let statusCode = result.statusCode
                switch statusCode{
                case 200..<300:
                    print("success")
                default:
                    print("ERROR")
                }
            case .failure(let error):
                print("Network request failed: \(error)")
            }
        }
    }
}
