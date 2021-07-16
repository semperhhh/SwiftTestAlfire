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

class MusicVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "music"
        self.view.addSubview(tableview)
        tableview.snp.makeConstraints { (m) in
            m.edges.equalTo(self.view)
        }
        
        MusicData().request { list in
            self.dataList = list
            self.tableview.reloadData()
        }
    }
    
    // MARK: lazy
    private lazy var tableview: UITableView = {
        let v = UITableView()
        v.separatorStyle = .none
        v.backgroundColor = UIColor.systemGreen
        v.estimatedRowHeight = 44
        v.delegate = self
        v.dataSource = self
        v.register(MusicTableViewCell.self, forCellReuseIdentifier: "cell")
        return v
    }()
    
    var dataList: [MusicModel] = []
}

extension MusicVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MusicTableViewCell
        return cell
    }
    
    
}
