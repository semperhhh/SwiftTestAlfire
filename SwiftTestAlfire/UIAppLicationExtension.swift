//
//  UIAppLicationExtension.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/17.
//

import Foundation

import UIKit

extension UIApplication {
    
    var keyWindow: UIWindow? {
        connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows
            .first(where: { $0.isKeyWindow })
    }
    
    var rootViewController: UIViewController? {
        let keyWindow = connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .map({ $0 as? UIWindowScene })
                .compactMap({ $0 })
                .first?.windows
                .first(where: { $0.isKeyWindow })
        return keyWindow?.rootViewController
    }
    
    /// 版本号
    static var appVersion: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
    }
    
    static var userInterfaceStyle: String {
        Bundle.main.object(forInfoDictionaryKey: "UIUserInterfaceStyle") as? String ?? "system"
    }
}
