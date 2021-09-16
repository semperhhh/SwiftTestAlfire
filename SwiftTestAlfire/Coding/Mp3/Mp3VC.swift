//
//  Mp3VC.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/26.
//

import Foundation
import UIKit
import AVFAudio

struct Mp3Navigating: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        self.navigate(to: Mp3VC(), from: viewController, using: transitionType)
    }
}

class Mp3VC: BasicViewController {
    override func viewDidLoad() {
        view.backgroundColor = .designKit.white
        
        addNavigationNormal(true, title: "音频")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        haha()
    }
}
