//
//  UIView-ZPHExtension.swift
//  Alamofire
//
//  Created by zph on 2021/8/26.
//

import Foundation

protocol SnapShotProtocol {
    
}

public struct SnapShotViewDSL: SnapShotProtocol {

    // MARK: view的截图扩展

    /// create image of view
    /// - Returns: img
    public func snapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.view.layer.frame.size, self.view.isOpaque, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        self.view.layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// create image of view
    /// - Parameter afterUpdates: 是否在view更新后
    /// - Returns: img
    public func snapshot(_ afterUpdates: Bool) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.view.layer.frame.size, self.view.isOpaque, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        self.view.drawHierarchy(in: self.view.layer.bounds, afterScreenUpdates: afterUpdates)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    internal let view: UIView
    
    internal init(view: UIView) {
        self.view = view
    }
}

public extension UIView {
    
    var ph: SnapShotViewDSL {
        SnapShotViewDSL(view: self)
    }
}
