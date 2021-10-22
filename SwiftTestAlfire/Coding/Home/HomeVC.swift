//
//  HomeVC.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/7/4.
//

import UIKit
import SwiftUI

class HomeVC: BasicTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = L10n.Localizable.homeKey
        self.view.backgroundColor = UIColor.designKit.F5F7F9Background
        addNavigationNormal(title: L10n.Localizable.homeKey)
        tableview.register(HomeTopZoonCell.self, forCellReuseIdentifier: "topZoon")
        tableview.snp.makeConstraints { m in
            m.bottom.left.right.equalToSuperview()
            m.top.equalTo(navigationView!.snp.bottom)
        }
        
        HomeData().requestLocal { list in
            self.topZoonList = list
            self.tableview.reloadData()
        }
    }
    
    lazy var topZoonList: [HomeTopZoonModel] = []
}

extension HomeVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topZoonList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topZoon", for: indexPath) as! HomeTopZoonCell
        cell.model = topZoonList[indexPath.row]
        return cell
    }
}
