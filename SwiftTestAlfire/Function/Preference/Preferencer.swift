//
//  Preference.Swlft.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/26.
//

import Foundation

enum PreferencerName: String {
    case dark
}

struct Preferencer {

    static func set(_ value: Any, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
    static func value(_ key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
}
