//
//  NetWorkUtil.swift
//  FlutterNet
//
//  Created by ldd on 2022/9/9.
//

import SwiftUI
import Moya
import SwiftyJSON

private enum Profile {
    case test,pro
    
}
fileprivate let profile: Profile = Profile.test

let kBaseApi = profile == Profile.test ? "http://127.0.0.1" : "https://itbug.shop"

public class MyHttpUtil {
    public class func request<T: TargetType>(_ target: T, success:@escaping((JSON) -> Void),failure: ((Int?,String?) -> Void)?) {
        let provider = MoyaProvider<T>(plugins:[
            RequestHandlingPlugin()
        ])
        
        provider.request(target) { result in
            switch result {
                
            case let .success(response):
                do {
                    let resObject = try? response.mapJSON()
                    let responseObject = JSON(resObject ?? "")
                    let code = responseObject["state"].intValue
                    let msg = String(describing: responseObject["message"])
                    switch code {
                    case 200 :
                        success(responseObject)
                    default:
                        failureHandle(failure: failure, stateCode: code, message: msg)
                    }
                }
            case let .failure(error):
                let stateCode = error.response?.statusCode ?? 1000
                let message = "请求出错,错误码: "+String(stateCode)
                failureHandle(failure: failure, stateCode: stateCode, message: error.errorDescription ?? message)
            }
        }
        
        func failureHandle(failure: ((Int?,String?) -> Void)? , stateCode:Int?, message: String){
            failure?(stateCode,message)
        }
    }
}



enum API {
    
    //  获取分类信息
    case getCategorys(name: String)
    case getAllCategorys
}


extension API: TargetType {
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
    
 

    
    
    var path: String {
        switch self {
        case .getCategorys:
            return "/api/blog/category/findByName"
        case .getAllCategorys:
            return "/api/res/cates"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    
    
    var task: Task {
        var params: [String:Any] = [:]
        
        switch self {
        case .getCategorys(let name):
            params["name"] = name
        default:
            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    var baseURL: URL {
        switch self {
        default:
            return URL(string: kBaseApi)!
        }
    }
}


class RequestHandlingPlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mutateableRequest = request
        return mutateableRequest.appendCommonParams()
    }
}

extension TargetType {
    var headers: [String: String]? {
        return nil
    }
}

extension URLRequest {
    
    
    private var commonParams: [String: Any]? {
        let header = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        return header
    }
    
    mutating func appendCommonParams() -> URLRequest {
        let request = try? encoded(parameters: commonParams, parameterEncoding: URLEncoding(destination: .queryString))
        assert(request != nil, "添加参数失败,请检查参数重试")
        return request!
    }
    
    func encoded(parameters:[String: Any]?,parameterEncoding: ParameterEncoding) throws -> URLRequest {
        do{
            return try  parameterEncoding.encode(self, with: parameters)
        }catch{
            throw MoyaError.parameterEncoding(error)
        }
    }
}
