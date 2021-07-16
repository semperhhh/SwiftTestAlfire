//
//  MusicModel.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/28.
//

import UIKit

struct MusicModel :SwiftyJsonModelProtocol {
    init(_ json: [String: Any]) {
        
        self.name = "MusicModel"
        self.image = "123"
        self.contentUrl = "contentUrl"
    }
    
    var name: String = ""
    var image: String = ""
    var contentUrl: String = ""
    
}
