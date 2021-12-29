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
    func asAvatar(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height), byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        layer.mask = shape
    }
    
    func asAvatarOfAutoLayout(corners: UIRectCorner, radius: CGFloat) {
        self.layoutIfNeeded()
        self.asAvatar(corners: corners, radius: radius)
    }
}
