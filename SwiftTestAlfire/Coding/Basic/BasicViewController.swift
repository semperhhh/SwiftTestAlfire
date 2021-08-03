//
//  BasicViewController.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/3.
//

import UIKit
import ZPHSuppleKit

class BasicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let naviView = navigationView {
            
            self.view.addSubview(naviView)
            naviView.snp.makeConstraints { m in
                m.top.left.right.equalToSuperview()
                m.height.equalTo(kNavigationHeight)
            }
        }
    }
    
    /// 自定义导航栏
    var navigationView: NavigationView? = {
        let v = NavigationView()
        return v
    }()
    
    var navigationTitle: NSString = "" {
        didSet {
            print(navigationTitle)
        }
    }
}
