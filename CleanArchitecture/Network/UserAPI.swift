import RxSwift
import Alamofire
import Foundation

public enum UserAPI {
    case fetchAllUser
    case serchUser(id:String)
}

extension UserAPI: Router, URLRequestConvertible {
    // Base Url
    public var baseURL: String {
        return "http://localhost:3000/user"
    }
    
    // Base Url 뒤에 붙는 path
    public var path: String {
        switch self {
            
        case .fetchAllUser:
            return "/user_all"
        case .serchUser:
            return "/user"
        }
    }
    
    // API 요청 방식
    public var method: HTTPMethod {
        switch self {
        case .fetchAllUser, .serchUser:
            return .get
        }
    }
    
    // API 요청 헤더
    public var headers: [String: String] {
        switch self {
        case .fetchAllUser,.serchUser:
            return [
                "Content-Type": "application/json",
            ]
        }
    }
    
    // 서버에 보낼 데이터
    public var parameters: [String: Any]? {
        switch self {
            
        case .fetchAllUser:
            return nil
        case .serchUser(id: let id):
            return ["id":"2f206ed0-0f4b-429b-a329-bd435e62665a"]
        }

    }
    
    // 인코딩 방식
    // 파라미터로 보내야할 것이 있다면, URLEncoding.default
    // 바디에 담아서 보내야할 것이 있다면, JSONEncoding.default
    public var encoding: ParameterEncoding? {
        switch self {
        case .fetchAllUser:
            return nil
        
            
        case .serchUser:
            return URLEncoding.default
            
        }
    }
    
    // request 구성하여 리턴
    public func asURLRequest() throws -> URLRequest {
        print("BASE: \(baseURL) + \(path)")
        let url = URL(string: baseURL + path)
        var request = URLRequest(url: url!)
        
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        if let encoding = encoding {
            return try encoding.encode(request, with: parameters)
        }
        
        return request
    }
}
