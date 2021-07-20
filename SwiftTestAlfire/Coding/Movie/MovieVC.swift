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
    }
    
    override func requestData() {
        MovieData().requestLocal { (list) in
            self.dataList = list
            self.tableview.reloadData()
            self.endRefreshing()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieVC {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        cell.model = dataList[indexPath.row] as? MovieModel
        return cell
    }
}
