//
//  MusicData.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/16.
//

import UIKit

class MusicData: APISession {
    
    typealias ReponseType = MusicModel

    func request(closure: @escaping ([ReponseType]) -> Void) {
        self.post("@/lists/getListElements/6.0.0", parameters: ["listName": "影视列表"], headers: nil) { model in
            
            var list: [ReponseType] = []
            list.append(model)
            closure(list)
        }
    }
}
