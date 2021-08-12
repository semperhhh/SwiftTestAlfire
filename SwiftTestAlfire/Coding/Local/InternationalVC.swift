//
//  InternationalVC.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/26.
//

import Foundation
import UIKit

struct InternationalNavigating: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        self.navigate(to: InternationalVC(), from: viewController, using: transitionType)
    }
}

class InternationalVC: BasicViewController {
    override func viewDidLoad() {
        view.backgroundColor = .designKit.white
        addNavigationNormal(true, title: "多语言")
    }
}
