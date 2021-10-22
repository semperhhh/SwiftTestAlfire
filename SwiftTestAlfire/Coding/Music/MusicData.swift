//
//  MusicData.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/16.
//

import UIKit

class MusicData: APISession {
    
    typealias ReponseType = MusicResponseModel
    
    /// 网络请求
    /// - Parameter closure: 回调
    func request(closure: @escaping ([MusicModel]) -> Void) {
        self.post("@/lists/getListElements/6.0.0", parameters: ["listName": "影视列表"], headers: nil) { model in
            
            var list: [MusicModel] = []
            list = model.listElements
            closure(list)
        }
    }
    
    /// 本地数据
    func requestLocal(closure: @escaping ([MusicModel]) -> Void) {
        
        guard let musicJson = try? String.init(contentsOfFile: Bundle.main.path(forResource: "music_result.json", ofType: nil) ?? "") else {
            print("musicJson error")
            return
        }
        
        guard let jsonData = musicJson.data(using: .utf8) else {
            return
        }
    
        guard let list: [[String: Any]] = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [[String: Any]] else {
            return
        }
        
        var closureList: [MusicModel] = []
        for dict in list {
            let m = MusicModel(JSON(dict))
            closureList.append(m)
        }
        closure(closureList)
    }
}
