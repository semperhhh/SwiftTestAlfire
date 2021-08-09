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
    }
    
    /// 自定义导航栏
    var navigationView: NavigationView?
    
    var navigationTitle: String = "" {
        didSet {
            if let navi = navigationView {
                navi.titleLabel.text = navigationTitle
            }
        }
    }
}

extension BasicViewController: NavigationViewing {
    
    var previousViewController: UIViewController? {
        if let index = self.navigationController?.viewControllers.count {
            if index > 1, let vc = self.navigationController?.viewControllers[index - 1] {
                return vc
            }
        }
        return nil
    }
    
    func navigationBackButtonAction() {
        if let _ = previousViewController {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func addNavigation(_ haveBackBtn: Bool = false, title: String = "") {
        let v = NavigationView()
        if haveBackBtn {
            v.addNavigationBackBtn()
        }
        v.navigationViewDelegate = self
        self.view.addSubview(v)
        v.snp.makeConstraints { m in
            m.top.left.right.equalToSuperview()
            m.height.equalTo(kNavigationHeight)
        }
        navigationView = v
        navigationTitle = title
    }
}
