//
//  InternationalShared.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/13.
//

import Foundation

class InternationalShared {
    
    enum InternationalLanguage {
        case 中文, 英语
    }
    
    /// 当前语言
    class var currentLanguage:InternationalLanguage {
        let str = Locale.preferredLanguages.first ?? "zh"
        if str.contains("zh") {
            return .中文
        } else {
            return .英语
        }
    }
    
    /// 切换语言
    func changeLanguage() {
        
    }
}
