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
}

extension BasicViewController: NavigationViewDelegate {
    
    /// 是否有前一个控制器
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
    
    @objc func navigationRightButtonAction() {
        print("navigationRightButtonAction")
    }
    
    func addNavigationNormal(_ haveBackBtn: Bool = false, title: String = "") {
        let v = NavigationNormalView(hasBackButton: haveBackBtn)
        v.navigationViewDelegate = self
        v.addNavigationTitleLabel(title)
        self.view.addSubview(v)
        v.snp.makeConstraints { m in
            m.top.left.right.equalToSuperview()
            m.height.equalTo(kNavigationHeight)
        }
        navigationView = v
    }
    
    func addNavigationSearch(_ haveBackBtn: Bool = false, searchCallback: @escaping (() -> Void)) {
        let v = NavigationSearchView(hasBackButton: haveBackBtn)
        v.navigationViewDelegate = self
        v.searchActionCallback = searchCallback
        self.view.addSubview(v)
        v.snp.makeConstraints { m in
            m.top.left.right.equalToSuperview()
            m.height.equalTo(kNavigationHeight + 8)
        }
        navigationView = v
    }
}
