//
//  Navigating.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/17.
//

import Foundation
import UIKit

protocol Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String: String])
}

extension Navigating {
    /// 跳转
    /// - Parameters:
    ///   - destinationViewController: 目标
    ///   - sourceViewController: 源
    ///   - transitionType: 跳转方式
    func navigate(to destinationViewController: UIViewController, from sourceViewController: UIViewController, using transitionType: TransitionType) {
        switch transitionType {
        case .show:
            sourceViewController.show(destinationViewController, sender: nil)
        case .present:
            sourceViewController.present(destinationViewController, animated: true)
        }
    }
}
