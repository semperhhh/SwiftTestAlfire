//
//  MovieViewController.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/19.
//

import UIKit

struct MovieNavigating: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        navigate(to: MovieVC(), from: viewController, using: transitionType)
    }
}

class MovieVC: BasicTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "movie"
        
        tableview.register(MovieTableViewCell.self, forCellReuseIdentifier: "cell")
        addRefreshHeader().addRedfreshFooter()
        tableview.snp.makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
        tableview.mj_header?.beginRefreshing()
        tableview.tableHeaderView = searchBar
    }
    
    override func requestData() {
        MovieData().requestLocal { (list) in
            self.dataList = list
            self.tableview.reloadData()
            self.endRefreshing()
        }
    }

    lazy var searchBar: ZPHSearchBar = {
        let v = ZPHSearchBar(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 44.0))
        return v
    }()
}

class ZPHSearchBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.designKit.F5F7F9Card
        
        addSubview(searchBtn)
        searchBtn.snp.makeConstraints { m in
            m.top.left.equalTo(Spacing.extraSmall)
            m.right.bottom.equalTo(-Spacing.extraSmall)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var searchBtn: UIButton = {
        let v = UIButton()
        v.backgroundColor = UIColor.designKit.grey
        v.setTitle("搜索", for: .normal)
        v.titleLabel?.font = UIFont.designKit.subTitle
        v.setTitleColor(.designKit.color666666, for: .normal)
        v.asAvatar()
        return v
    }()
}

extension MovieVC {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        cell.model = dataList[indexPath.row] as? MovieModel
        return cell
    }
}
