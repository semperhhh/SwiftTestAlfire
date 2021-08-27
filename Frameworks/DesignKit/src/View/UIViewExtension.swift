//
//  UIViewExtension.swift
//  DesignKit
//
//  Created by zhangpenghui on 2021/4/4.
//

import Foundation

public extension UIView {
    
    /// 头像圆角
    /// - Parameter cornerRadius: 圆角
    func asAvatar(cornerRadius: CGFloat = 4) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    /// 部分圆角
    /// - Parameters:
    ///   - corners: 角
    ///   - radius: 大小
    func asAvatar(corners: UIRectCorner, rect: CGSize, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: rect.width, height: rect.height), byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        layer.mask = shape
    }
}
