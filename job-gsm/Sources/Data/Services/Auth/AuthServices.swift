import Foundation
import Moya

enum AuthServices {
    case signIn(param: SignInRequest)
    case refresh(refreshToken: String)
}


extension AuthServices: TargetType {
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "/auth/signin"
        case .refresh:
            return "/auth/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn:
            return .post
        case .refresh:
            return .patch
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .signIn(let param):
            return .requestJSONEncodable(param)
        case .refresh:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .refresh(let refreshToken):
            return["Content-Type" :"application/json", "refreshToken" : refreshToken]
        default:
            return["Content-Type" :"application/json"]
        }
    }
}

