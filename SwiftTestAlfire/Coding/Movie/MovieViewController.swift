//
//  MovieViewController.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/19.
//

import UIKit

struct MovieNavigating: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        navigate(to: MovieViewController(), from: viewController, using: transitionType)
    }
}

class MovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "movie"
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
