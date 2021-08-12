//
//  DarkVC.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/26.
//

import Foundation
import UIKit

struct DarkNavigating: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        self.navigate(to: DarkVC(), from: viewController, using: transitionType)
    }
}

class DarkVC: BasicViewController {
    
    override func viewDidLoad() {

        view.backgroundColor = .designKit.white
        addNavigationNormal(true, title: "外观模式")
        view.addSubview(tableview)
        tableview.snp.makeConstraints { m in
            m.bottom.left.right.equalToSuperview()
            m.top.equalTo(navigationView!.snp.bottom)
        }

        let p: Int = (Preferencer.value(PreferencerName.dark.rawValue) as? Int) ?? 0
        guard let mode = UIUserInterfaceStyle(rawValue: p) else { return }
        setupMode(mode)
    }
    
    func setupMode(_ mode: UIUserInterfaceStyle) {
        let m1 = DarkModel(title: "跟随系统", isSelect: mode == .unspecified)
        let m2 = DarkModel(title: "浅色", isSelect: mode == .light)
        let m3 = DarkModel(title: "深色", isSelect: mode == .dark)
        dataList = [m1, m2, m3]
        tableview.reloadData()
    }
    
    
    
    private lazy var tableview: UITableView = {
        let v = UITableView()
        v.separatorStyle = .none
        v.backgroundColor = .designKit.white
        v.estimatedRowHeight = 44
        v.delegate = self
        v.dataSource = self
        v.register(DarkTableViewCell.self, forCellReuseIdentifier: "cell")
        return v
    }()
    
    var dataList: [DarkModel] = []
    
    var currentSelectCell: DarkTableViewCell?
}

extension DarkVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DarkTableViewCell
        let m = dataList[indexPath.row]
        cell.model = m
        if m.isSelect {
            currentSelectCell = cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell: DarkTableViewCell = tableView.cellForRow(at: indexPath) as! DarkTableViewCell
        guard cell != currentSelectCell else {
            return
        }
        currentSelectCell?.cellSelect(false)
        cell.cellSelect(true)
        currentSelectCell = cell
        Preferencer.set(indexPath.row, forKey: PreferencerName.dark.rawValue)
        DarkShared.changeMode(indexPath.row)
    }
}
