//
//  MusicVC.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/28.
//

import UIKit

struct MusicNavigating: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        self.navigate(to: MusicVC(), from: viewController, using: transitionType)
    }
}


class MusicVC: BasicTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "music"
        
        tableview.register(MusicTableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.snp.makeConstraints { (m) in
            m.edges.equalTo(self.view)
        }
        tableview.mj_header?.beginRefreshing()
    }
    
    // MARK: lazy
    override func requestData() {
        
//        MusicData().request { list in
//            self.dataList = list
//            self.tableview.reloadData()
//        }

        MusicData().requestLocal { list in
            self.dataList = list
            self.tableview.reloadData()
            self.endRefreshing()
        }
    }
}

extension MusicVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MusicTableViewCell
        cell.model = dataList[indexPath.row] as? MusicModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
