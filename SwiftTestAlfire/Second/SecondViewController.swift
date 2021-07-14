//
//  SecondViewController.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/6/15.
//

import UIKit

struct SecondNavigating: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        navigate(to: SecondViewController(), from: viewController, using: transitionType)
    }
}

class SecondViewController: UIViewController {
    
    var dataList: [SecondModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.systemRed
        
        self.view.addSubview(self.tableview)
        self.tableview.snp.makeConstraints { m in
            m.edges.equalToSuperview()
        }
        
        // 网络请求
        Network.request("https://router-test.gamersky.com/@/lists/getListElements/6.0.0", method: .post, parameters: ["listName": "影视列表"]).responseJSON { (isSuccess) in
            print(isSuccess)
        }

//        if let jsonDict = json.value as? [String: Any], let array = jsonDict["listElements"] as? [[String: Any]] {
//
//            for dict in array {
//                let model = SecondModel(title: dict["title"] as! String)
//            }
//        }
    }
    
    lazy var tableview: UITableView = {
        let v = UITableView()
        v.backgroundColor = UIColor.systemGreen
        v.dataSource = self
        v.delegate = self
        v.register(SecondTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        return v
    }()
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondTableViewCell
        cell.model = self.dataList[indexPath.row]
        return cell
    }
    
}


class SecondTableViewCell: UITableViewCell {
    
    var model: SecondModel? {
        didSet {
            self.textLab.text = model?.title
        }
    }
    
    lazy var textLab: UILabel = {
        let v = UILabel()
        v.numberOfLines = 0
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.textLab)
        self.textLab.snp.makeConstraints { m in
            m.edges.equalToSuperview()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("cell touches");
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
