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
@_exported import SwiftyJSON
@_exported import Kingfisher
@_exported import MJRefresh

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        let navi = UINavigationController(rootViewController: self)
        UIApplication.shared.windows.first?.rootViewController = navi
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

//        AppRouter.shared.route(to: URL(string: "https://SwiftTestAlfire.com/Second"), from: self, using: .show)
//        AppRouter.shared.route(to: URL(string: "https://SwiftTestAlfire.com/Music"), from: self, using: .show)
        AppRouter.shared.route(to: URL(string: "https://SwiftTestAlfire.com/Movie"), from: self, using: .show)
    }
}

