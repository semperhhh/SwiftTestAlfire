//
//  ViewController.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/13.
//

import UIKit
import DesignKit
import ZPHSuppleKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.systemYellow
        
        let navi = UINavigationController(rootViewController: self)
        UIApplication.shared.windows.first?.rootViewController = navi
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

//        AppRouter.shared.route(to: URL(string: "https://SwiftTestAlfire.com/Second"), from: self, using: .show)
        AppRouter.shared.route(to: URL(string: "https://SwiftTestAlfire.com/Music"), from: self, using: .show)
    }
}

