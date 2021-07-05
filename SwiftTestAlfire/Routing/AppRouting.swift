//
//  AppRouting.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/13.
//

import Foundation
import UIKit

protocol AppRouting {
    /// 注册
    /// - Parameters:
    ///   - path: 路径
    ///   - navigator: 导航
    func register(path: String, navigator: Navigating)
    
    /// 路由
    /// - Parameters:
    ///   - url: 目标
    ///   - routingSource: 源
    ///   - transitionType: 方式
    func route(to url: URL?, from routingSource: RoutingSource?, using transitionType: TransitionType)
}
