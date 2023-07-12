import Foundation
import Moya

enum JobServices {
    case homeList(authorization: String)
    case detail(authorization: String, idx: Int)
    case filter(authorization: String, major: Int)
}


extension JobServices: TargetType {
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .homeList:
            return "/job/"
        case let .detail(_,idx):
            return "/job/\(idx)"
        case let .filter(_, major):
            return "/job/major/\(major)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .homeList, .detail, .filter:
            return .get
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .homeList, .detail, .filter:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .homeList(let authorization), .detail(let authorization, _), .filter(let authorization,_):
            return["Content-Type" :"application/json", "Authorization" : authorization]
        default:
            return["Content-Type" :"application/json"]
        }
    }
}

