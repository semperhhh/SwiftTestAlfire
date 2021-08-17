//
//  Bluetooth.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/17.
//

import Foundation

struct BluetoothNavigatng: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        navigate(to: BluetoothVC(), from: viewController, using: transitionType)
    }
}

class BluetoothVC: BasicViewController {
    
    var bleManager: BleManager = BM
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .designKit.white
        addNavigationNormal(true, title: "Bluetooth")
    }
}
