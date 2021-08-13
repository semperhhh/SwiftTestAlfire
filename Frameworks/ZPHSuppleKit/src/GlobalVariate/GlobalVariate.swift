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
/// - Returns: App状态栏的高度 20/44
public var kStatusBarHeight: CGFloat {
    if let manager = UIApplication.shared.windows.first?.windowScene?.statusBarManager {
        return manager.statusBarFrame.height
    }
    return 20
}

/// App状态栏的样式
public var KStatusBarStyle: UIStatusBarStyle {
    if let manager = UIApplication.shared.windows.first?.windowScene?.statusBarManager {
        return manager.statusBarStyle
    }
    return .default
}

/// 手机屏幕宽
public var kScreenWidth: CGFloat {
    UIScreen.main.bounds.size.width
}
/// 手机屏幕高
public var kScreenHeight: CGFloat {
    UIScreen.main.bounds.size.height
}

/// 顶部安全区的高
public var kSafeTopHeight: CGFloat {
    if let window = UIApplication.shared.windows.first {
        return window.safeAreaInsets.top
    }
    return 0
}
/// 底部安全区的高
public var kSafebottomHeight: CGFloat {
    if let window = UIApplication.shared.windows.first {
        return window.safeAreaInsets.bottom
    }
    return 0
}

/// 导航栏的高度
public var kNavigationHeight: CGFloat {
    44 + kStatusBarHeight
}
