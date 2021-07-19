//
//  RoutingSource.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/17.
//

import Foundation
import UIKit

/// 空协议,让路由和viewcontroller解耦
protocol RoutingSource {
    
}

extension UIViewController: RoutingSource {
    
}
