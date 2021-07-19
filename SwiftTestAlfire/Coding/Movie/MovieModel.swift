//
//  MovieModel.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/7/19.
//

import Foundation

struct MovieModel: SwiftyJsonModelProtocol {
    var title: String = ""
    var subTitle: String = ""
    var imageUrl: String = ""
    
    init(_ json: JSON) {
        title = json["title"].stringValue
        subTitle = json["subTitle"].stringValue
        imageUrl = json["imageUrl"].stringValue
    }
}
