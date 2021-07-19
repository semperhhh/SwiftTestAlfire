//
//  MusicModel.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/28.
//

import UIKit

struct MusicResponseModel: SwiftyJsonModelProtocol {
    var error: String = ""
    var listElements: [MusicModel] = []
    init(_ json: JSON) {
        error = json["error"].stringValue
        for elementJSON in json["listElements"].arrayValue {
            let musicModel = MusicModel(elementJSON)
            listElements.append(musicModel)
        }
    }
}

struct MusicModel :SwiftyJsonModelProtocol {
    init(_ json: JSON) {
        self.name = json["name"].stringValue
        self.image = json["image"].stringValue
        self.contentUrl = json["contentUrl"].stringValue
    }
    
    var name: String = ""
    var image: String = ""
    var contentUrl: String = ""
    
}
