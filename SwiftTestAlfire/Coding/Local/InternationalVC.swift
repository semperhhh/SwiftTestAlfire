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
        view.addSubview(tableview)
        tableview.snp.makeConstraints { m in
            m.bottom.left.right.equalToSuperview()
            m.top.equalTo(navigationView!.snp.bottom)
        }
        
        setupMode(InternationalShared.currentLanguage)
    }
    
    func setupMode(_ languageStr: InternationalShared.InternationalLanguage) {
        let m3 = InternationalModel(name: "跟随系统", isSelect: true)
        dataList = [m3]
    }
    
    private lazy var tableview: UITableView = {
        let v = UITableView()
        v.separatorStyle = .none
        v.backgroundColor = .designKit.white
        v.estimatedRowHeight = 44
        v.delegate = self
        v.dataSource = self
        v.register(InternationalCell.self, forCellReuseIdentifier: "cell")
        return v
    }()
    
    var dataList: [InternationalModel] = []
}

extension InternationalVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InternationalCell
        cell.model = dataList[indexPath.row]
        return cell
    }
}
