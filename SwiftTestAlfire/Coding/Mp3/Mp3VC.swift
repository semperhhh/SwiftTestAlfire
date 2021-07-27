//
//  Mp3VC.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/26.
//

import Foundation
import UIKit

struct Mp3Navigating: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        self.navigate(to: Mp3VC(), from: viewController, using: transitionType)
    }
}

class Mp3VC: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .designKit.white
    }
}
