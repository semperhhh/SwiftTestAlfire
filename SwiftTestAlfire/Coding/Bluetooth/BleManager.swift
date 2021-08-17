//
//  BleManager.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/17.
//

import Foundation
import CoreBluetooth

// 单例
public let BM = BleManager.shared()

open class BleManager: NSObject {

    static func shared() -> BleManager {
        let b = BleManager()
        let queue = DispatchQueue(label: "centralQueue")
        let m = CBCentralManager(delegate: b, queue: queue)
        b.manager = m
        return b
    }
    
    /// 主设备
    var manager: CBCentralManager?
    
    /// 用于保存被发现设备
    var peripherals: [Any] = []
}

extension BleManager: CBCentralManagerDelegate {
    
    /// 主设备状态改变
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("unknown 未知")
        case .resetting:
            print("resetting 重启")
        case .unsupported:
            print("unsupported 不支持")
        case .unauthorized:
            print("unauthorized")
        case .poweredOff:
            print("poweredOff 关")
        case .poweredOn:
            print("poweredOn 开")
            // 第一个nil: 扫描周围所有的外设
            // 第二个nil: 添加option, 增加精确的查找范围
            manager?.scanForPeripherals(withServices: nil, options: nil)
        default:
            break
        }
    }
    
    /// 扫描到设备会进入方法
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("扫描到设备 - \(peripheral.name ?? "未知名字")")
        // 接下来可以连接设备
    }
}
