//
//  ViewController.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.systemYellow;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.systemRed;
//        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true, completion: nil)
//        self.show(vc, sender: nil)
//        self.showDetailViewController(vc, sender: nil)
        
    }
}

