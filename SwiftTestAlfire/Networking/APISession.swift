//
//  APISession.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/7/5.
//

import Foundation
import Alamofire

/// swiftyJson解析的模型要遵守
protocol SwiftyJsonModelProtocol {
    init(_ json: [String: Any])
}

protocol APISession {
    /// 类型
    associatedtype ReponseType: SwiftyJsonModelProtocol
    /// post请求
    /// - Parameters:
    ///   - path: 路径
    ///   - parameters: 参数
    ///   - headers: 请求头
    ///   - closure: 请求回调
    func post(_ path: String, parameters: Parameters?,  headers: HTTPHeaders?, closure: @escaping (_ response: ReponseType) -> Void)
}

extension APISession {
    
    var baseUrl: URL {
        return API.baseURL
    }
    
    var defaultHeaders: HTTPHeaders {
        let headers: HTTPHeaders = [
            "x-app-platform": "iOS",
            "x-app-version": UIApplication.appVersion,
            "x-os-version": UIDevice.current.systemVersion
        ]
        return headers
    }
    
    func post(_ path: String, parameters: Parameters? = nil,  headers: HTTPHeaders? = [:], closure: @escaping (_ response: ReponseType) -> Void) {
        request(path, method: .post, headers: headers, parameters: parameters, encoding: JSONEncoding.default, closure: closure)
    }
}

private extension APISession {
    func request(_ path: String, method: HTTPMethod, headers: HTTPHeaders?, parameters: Parameters?, encoding: ParameterEncoding, closure: @escaping (_ response: ReponseType) -> Void) {
        let url = baseUrl.appendingPathComponent(path)
        
        let allHeader: HTTPHeaders
        if let h = headers {
            allHeader = HTTPHeaders(defaultHeaders.dictionary.merging(h.dictionary) { $1 })
        } else {
            allHeader = HTTPHeaders(defaultHeaders.dictionary)
        }
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: allHeader, interceptor: nil, requestModifier: nil)
            .validate()
            .responseJSON { json in
                switch json.response?.statusCode {
                case 200:
                    print("success")
                    let m = ReponseType(json.value as! [String: Any])
                    closure(m)
                default:
                    print("error")
                    let m = ReponseType(json.value as! [String: Any])
                    closure(m)
                }
            }
    }
}
