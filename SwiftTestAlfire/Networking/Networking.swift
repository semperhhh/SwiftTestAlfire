//
//  Networking.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/6/15.
//

import Foundation
import Alamofire

public let Network = Networking.shared

open class Networking {
    
    static let shared = Networking()
    
    func request<Parameters: Encodable>(_ convertible: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil) {
        
        AF.request(convertible, method: method, parameters: parameters).responseData { data in
            if data.response?.statusCode == 200 {
                print("success")
            } else {
                print("faild")
            }
            
            do {
                let dict: [String: Any] = try JSONSerialization.jsonObject(with: data.value!, options: .mutableContainers) as! [String : Any]
                print(dict)
            } catch {
                print("faild")
            }
        
        }
    }
}
