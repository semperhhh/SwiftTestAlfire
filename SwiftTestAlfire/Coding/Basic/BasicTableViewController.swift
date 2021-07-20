//
//  BasicTableViewController.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/19.
//

import UIKit

class BasicTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
        self.view.addSubview(tableview)
    }
    
    @discardableResult
    func addRefreshHeader() -> Self {
        tableview.mj_header = Refresher.headerRefresh(targer: self, action: #selector(headerReloadData))
        return self
    }
    
    @discardableResult
    func addRedfreshFooter() -> Self {
        tableview.mj_footer = Refresher.footerRefresh(targer: self, action: #selector(footerReloadData))
        return self
    }
    
    @objc func headerReloadData() {
        self.pageIndex = 0
        self.requestData()
    }
    
    @objc func footerReloadData() {
        self.pageIndex += 1
        self.requestData()
    }
    
    /// 子类重写
    func requestData() {
        
    }
    
    func endRefreshing() {
        if tableview.mj_header != nil, tableview.mj_header!.isRefreshing {
            tableview.mj_header?.endRefreshing()
        }
        if tableview.mj_footer != nil, tableview.mj_footer!.isRefreshing {
            tableview.mj_footer?.endRefreshing()
        }
    }
    
    // MARK: lazy
    
    /// data
    var dataList: [SwiftyJsonModelProtocol] = []
    /// 分页
    var pageIndex: Int = 0
    /// 数量
    var pageSize: Int = 20
    
    lazy var tableview: UITableView = {
        let v = UITableView()
        v.separatorStyle = .none
        v.backgroundColor = .white
        v.estimatedRowHeight = 44
        v.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return v
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BasicTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
