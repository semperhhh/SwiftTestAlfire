//
//  APISession.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/7/5.
//

import Foundation
import Alamofire

protocol APISession {
    /// 类型
    associatedtype ReponseType: Codable
    /// post请求
    /// - Parameters:
    ///   - path: 路径
    ///   - parameters: 参数
    ///   - headers: 请求头
    func post(_ path: String, parameters: Parameters?,  headers: HTTPHeaders) -> ReponseType
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
    
    func post(_ path: String, parameters: Parameters?, headers: HTTPHeaders) -> ReponseType {
        return request(path, method: .post, headers: headers, parameters: parameters, encoding: JSONEncoding.default)
    }
}

private extension APISession {
    func request(_ path: String, method: HTTPMethod, headers: HTTPHeaders, parameters: Parameters?, encoding: ParameterEncoding) -> ReponseType {
        let url = baseUrl.appendingPathComponent(path)
        let allHeader = HTTPHeaders(defaultHeaders.dictionary.merging(headers.dictionary) { $1 })
        
        let request = AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: allHeader, interceptor: nil, requestModifier: nil)
            .validate()
            .responseJSON { (response) in
                
                
            }
        
        return "" as! Self.ReponseType
    }
}
