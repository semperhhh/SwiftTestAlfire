//
//  DarkShared.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/27.
//

import Foundation

class DarkShared {
    
    class func currentMode() -> Int {
        let p: Int = (Preferencer.value(PreferencerName.dark.rawValue) as? Int) ?? 0
        return p
    }
    
    /// 改变颜色模式
    /// - Parameter mode: 模式
    class func changeMode(_ mode: Int) {
        UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: mode) ?? .unspecified
    }
}
