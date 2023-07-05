import Foundation
import Moya

enum JobServices {
    case homeList(authorization: String)
}


extension JobServices: TargetType {
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .homeList:
            return "/job/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .homeList:
            return .get
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .homeList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .homeList(let authorization):
            return["Content-Type" :"application/json", "Authorization" : authorization]
        default:
            return["Content-Type" :"application/json"]
        }
    }
}

