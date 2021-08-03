//
//  NavigationController.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/3.
//

import UIKit

class NavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNavigationBarHidden(true, animated: false)
        self.interactivePopGestureRecognizer?.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = true
        
//        let target = self.interactivePopGestureRecognizer?.delegate
//        let pan = UIPanGestureRecognizer(target: target, action: #selector(handleNavigationTransition:))
//        pan.delegate = self
//        self.view.addGestureRecognizer(pan)
    }
}
