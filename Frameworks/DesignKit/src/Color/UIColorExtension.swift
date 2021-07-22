//
//  ColorExtension.swift
//  DesignKit
//
//  Created by zhangpenghui on 2021/4/8.
//

import Foundation

public extension UIColor {

    /// 随机颜色
    class var random: UIColor {
        let r = (CGFloat.random(in: 0 ..< 256).truncatingRemainder(dividingBy: 256.0)) / 255.0
        let g = (CGFloat.random(in: 0 ..< 256).truncatingRemainder(dividingBy: 256.0)) / 255.0
        let b = (CGFloat.random(in: 0 ..< 256).truncatingRemainder(dividingBy: 256.0)) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
    static let designKit = DesignKitPalette.self
    
    enum DesignKitPalette {
        ///  动态颜色
        /// - Parameters:
        ///   - light: 浅色
        ///   - dark: 深色
        /// - Returns： 颜色
        static private func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
            return UIColor {
                $0.userInterfaceStyle == .dark ? dark : light
            }
        }
        
        public static let primary: UIColor = dynamicColor(light: UIColor(hex: 0xFF21C38F), dark: UIColor(hex: 0xFF000000))
        public static let main_app: UIColor = dynamicColor(light: UIColor(hex: 0xFFF5F5F5), dark: UIColor(hex: 0xFF000000))
        public static let red: UIColor = UIColor(hex: 0xFFFF4351)
        public static let orange: UIColor = UIColor(hex: 0xFFFEAE1B)
        public static let grey: UIColor = UIColor(hex: 0xFFEEEEEE)
        public static let blue: UIColor = UIColor(hex: 0xFF229ffd)
        public static let green: UIColor = UIColor(hex: 0xFFA5DE37)
        public static let purple: UIColor = UIColor(hex: 0xFF7B72E9)
        public static let black: UIColor = UIColor(hex: 0xFF0c0c0c)
        
        /// 一级背景色
        public static let F5F7F9Background: UIColor = dynamicColor(light: UIColor(hex: 0xFFF5F7F9), dark: UIColor(hex: 0xFF17171A))
        /// 二级背景色 白色
        public static let white: UIColor = dynamicColor(light: UIColor(hex: 0xFFFFFFFF), dark: UIColor(hex: 0xFF222226))
        /// 三级背景色
        public static let F5F7F9Card: UIColor = dynamicColor(light: UIColor(hex: 0xFFF5F7F9), dark: UIColor(hex: 0xFF2E2E33))
        /// 分割线颜色
        public static let EEEEEE: UIColor = dynamicColor(light: UIColor(hex: 0xFFEEEEEE), dark: UIColor(hex: 0xFF323238))
        /// 一级文字色
        public static let color222222: UIColor = dynamicColor(light: UIColor(hex: 0xFF222222), dark: UIColor(hex: 0xFFD7D7D9))
        /// 二级文字色
        public static let color666666: UIColor = dynamicColor(light: UIColor(hex: 0xFF666666), dark: UIColor(hex: 0xFFA3A3A6))
        /// 三级文字色
        public static let color999999: UIColor = dynamicColor(light: UIColor(hex: 0xFF999999), dark: UIColor(hex: 0xFF717173))
    }
}
