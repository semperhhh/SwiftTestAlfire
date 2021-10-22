//
//  HomeData.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/10/21.
//

import Foundation

class HomeData: APISession {
    
    typealias ReponseType = HomeTopZoonModel
    
    func requestLocal(closure: @escaping ([HomeTopZoonModel]) -> Void) {
        guard let movieJson = try? String.init(contentsOfFile: Bundle.main.path(forResource: "home.json", ofType: nil) ?? "") else {
            print("homeJson error")
            return
        }
        
        guard let jsonData = movieJson.data(using: .utf8) else {
            return
        }
    
        guard let list: [[String: Any]] = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [[String: Any]] else {
            return
        }
        
        var closureList: [HomeTopZoonModel] = []
        for dict in list {
            let m = HomeTopZoonModel(JSON(dict))
            closureList.append(m)
        }
        closure(closureList)
    }
}
