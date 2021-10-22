//
//  MovieData.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/7/19.
//

import Foundation

class MovieData: APISession {
    typealias ReponseType = MovieModel
    
    /// 本地数据
    func requestLocal(closure: @escaping ([MovieModel]) -> Void) {
        
        guard let movieJson = try? String.init(contentsOfFile: Bundle.main.path(forResource: "movie_result.json", ofType: nil) ?? "") else {
            print("movieJson error")
            return
        }
        
        guard let jsonData = movieJson.data(using: .utf8) else {
            return
        }
    
        guard let list: [[String: Any]] = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [[String: Any]] else {
            return
        }
        
        var closureList: [MovieModel] = []
        for dict in list {
            let m = MovieModel(JSON(dict))
            closureList.append(m)
        }
        closure(closureList)
    }
}
