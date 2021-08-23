//
//  Bluetooth.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/17.
//

import Foundation
import CoreBluetooth

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
        view.addSubview(tableview)
        tableview.snp.makeConstraints { m in
            m.top.equalTo(navigationView!.snp.bottom)
            m.left.right.bottom.equalToSuperview()
        }
        
        bleManager.updatePeripherals {
            self.tableview.reloadData()
        }
    }
    
    private lazy var tableview: UITableView = {
        let v = UITableView()
        v.separatorStyle = .none
        v.backgroundColor = .designKit.white
        v.rowHeight = 44
        v.delegate = self
        v.dataSource = self
        v.register(BluetoothCell.self, forCellReuseIdentifier: "cell")
        return v
    }()
}

extension BluetoothVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bleManager.peripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BluetoothCell
        cell.model = bleManager.peripherals[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let m: CBPeripheral = bleManager.peripherals[indexPath.row]
        bleManager.managerConnect(peripheral: m, options: nil)
    }
}
