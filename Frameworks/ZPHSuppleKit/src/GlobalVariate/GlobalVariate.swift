//
//  GlobalVariate.swift
//  ZPHSuppleKit
//
//  Created by zph on 2021/7/23.
//

import Foundation
import UIKit

/// App状态栏的高度 (其实状态栏是变化的，比如打电话时，导航定位时...)
///
/// - Returns: App状态栏的高度
public var kStatusBarHeight: CGFloat {
    guard !UIApplication.shared.isStatusBarHidden else { return 0 }

    if #available(iOS 13.0, *) {
        if let manager = UIApplication.shared.windows.first?.windowScene?.statusBarManager {
            return manager.statusBarFrame.height
        }
    }
    return UIApplication.shared.statusBarFrame.height
}

/// 手机屏幕宽
public let kScreenWidth: CGFloat = UIScreen.main.bounds.size.width
/// 手机屏幕高
public let kScreenHeight: CGFloat = UIScreen.main.bounds.size.height


