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
        
        self.view.backgroundColor = UIColor.systemYellow
        
        let navi = UINavigationController(rootViewController: self)
        UIApplication.shared.windows.first?.rootViewController = navi
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc = SecondViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.title = """
second
"""
        self.show(vc, sender: nil)
    }
}

