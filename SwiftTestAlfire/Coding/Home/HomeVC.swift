//
//  HomeVC.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/7/4.
//

import UIKit

class HomeVC: BasicTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
        tableview.register(HomeTopZoonCell.self, forCellReuseIdentifier: "topZoon")
        tableview.snp.makeConstraints { m in
            m.edges.equalToSuperview()
        }
    }
    
    // MARK:
    lazy var topZoonList: [HomeTopZoonModel] = {
        var m1: HomeTopZoonModel = HomeTopZoonModel()
        m1.title = "音乐"
        m1.contentUrl = "https://SwiftTestAlfire.com/Music"
        var m2: HomeTopZoonModel = HomeTopZoonModel()
        m2.title = "电影"
        m2.contentUrl = "https://SwiftTestAlfire.com/Movie"
        return [m1, m2]
    }()
}

extension HomeVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "topZoon", for: indexPath) as! HomeTopZoonCell
            cell.modelList = topZoonList
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
