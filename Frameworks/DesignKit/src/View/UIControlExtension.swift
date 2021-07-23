//
//  UIControlExtension.swift
//  DesignKit
//
//  Created by zph on 2021/7/23.
//

import Foundation

public extension UIControl {
    
    func click(_ forEvent: Event = Event.touchUpInside, closure: () -> Void) {
        self.addTarget(self, action: #selector(controlClick), for: forEvent)
    }
    
    @objc func controlClick() {
        
    }
}
