//
//  BleManager.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/17.
//

import Foundation
import CoreBluetooth

// 蓝牙协议
protocol BleManagering {
    
    /// 更新设备列表
    /// - Parameter closure: 回调
    func updatePeripherals(closure: @escaping (() -> Void))
    
    /// 连接
    /// - Parameters:
    ///   - peripheral: 设备
    ///   - options: 可选
    func managerConnect(peripheral: CBPeripheral, options: [String: Any]?)
    
    /// 特征写入消息
    /// - Parameter str: 消息
    func managerCharacteristicWrite(str: String)
}

// 单例
public let BM = BleManager.shared

open class BleManager: NSObject, BleManagering {
    
    static let shared: BleManager = {
        let b = BleManager()
        let queue = DispatchQueue(label: "centralQueue")
        b.manager = CBCentralManager(delegate: b, queue: queue)
        print("bluetooth queue - \(queue)")
        return b
    }()
    
    /// 主设备
    var manager: CBCentralManager!
    
    /// 用于保存被发现设备
    var peripherals: [CBPeripheral] = []
    
    /// 连接的设备
    var peripheral: CBPeripheral?
    
    /// 连接的服务特征
    var character: CBCharacteristic?
    
    /// 更新列表回调
    var updatePeripheralsCallback: (() -> Void)?
    
    /// 更新列表
    func updateList() {
        DispatchQueue.main.async {
            // 更新列表
            self.updatePeripheralsCallback?()
        }
    }
}

extension BleManager {
    
    func updatePeripherals(closure: @escaping (() -> Void)) {
        print("updatePeripherals")
        updatePeripheralsCallback = closure
    }
    
    func managerConnect(peripheral: CBPeripheral, options: [String: Any]?) {
        manager.connect(peripheral, options: options)
    }
    
    func managerCharacteristicWrite(str: String) {
        if let d: Data = str.data(using: .utf8), (self.character != nil) {
            self.peripheral?.writeValue(d, for: self.character!, type: .withResponse)
        }
    }
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
            print("unauthorized 未授权")
        case .poweredOff:
            print("poweredOff 关")
        case .poweredOn:
            print("poweredOn 开")
            // 第一个nil: 扫描周围所有的外设
            // 第二个nil: 添加option, 增加精确的查找范围
            // CBCentralManagerScanOptionAllowDuplicatesKey 重复扫描已发现设备
            manager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: 0])
            
        default:
            break
        }
    }
    
    /// 蓝牙被后台杀掉,重连时走这个方法
    public func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]) {
        print("蓝牙被后台杀掉,重连时走这个方法")
    }
    
    /// 扫描到设备会进入方法
    /// rssi越大,信号越差
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        guard let name = peripheral.name else {
            return
        }
        print("扫描到设备 - \(name), rssi - \(RSSI)")
        peripherals.append(peripheral)
        
        updateList()
    }
    
    /// 连接成功回调
    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // 连接成功后停止扫描
        manager.stopScan()
        print("连接成功回调 - \(peripheral.name ?? "")")
        peripheral.delegate = self
        self.peripheral = peripheral
    
        // 扫描外设的服务
        peripheral.discoverServices(nil)
        
    }
    
    /// 连接失败回调
    public func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("连接失败回调")
    }
    
    /// 连接断开回调
    public func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("连接断开回调")
    }
}

extension BleManager: CBPeripheralDelegate {
    
    /// 发现服务的回调
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard error == nil else {
            print("didDiscoverServices error - \(peripheral.name ?? "") error - \(error?.localizedDescription ?? "")")
            return
        }
        if let services = peripheral.services {
            for service in services {
                print("service - \(service.uuid.uuidString)")
                // 扫描每个service的Characteristics，扫描到后会进入方法
                peripheral.discoverCharacteristics(nil, for: service)
            }
        }
    }
    
    /// 发现characteristics, 获取读的写的characteristics
    /// 发现特征
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard error == nil else {
            print("didDiscoverCharacteristicsFor error - \(error?.localizedDescription ?? "")")
            return
        }
        if let characteristics = service.characteristics {
            for character in characteristics {
                print("service: \(service.uuid), characteristic: \(character.uuid)")
                // 接收一次
                peripheral.readValue(for: character)
                // 订阅 实时接收 (发现特征之后一定要打开通知特性，否则写入数据之后，不会收到回复数据)
//                peripheral.setNotifyValue(true, for: character)
                
//                // 发送一条指令
//                if let data: Data = "硬件工程师给我的指令, 发送给蓝牙该指令, 蓝牙会给我返回一条数据".data(using: .utf8) {
//                    self.peripheral?.writeValue(data, for: character, type: .withResponse)
//                }
//                // 当发现characteristic有descriptor,回调didDiscoverDescriptorsForCharacteristic
//                peripheral.discoverDescriptors(for: character)
            }
        }
    }
    
    /// 写入回调
    /// - Parameters:
    ///   - peripheral: 外设
    ///   - characteristic: 特征
    ///   - error: 错误
    public func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        guard error != nil else {
            print("写入失败 characteristic = \(characteristic) error - \(error?.localizedDescription ?? "error")")
            return
        }
        print("写入成功  characteristic = \(characteristic)")
    }
    
    // 特征描述
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        
    }
    
    // MARK: 从外设读取数据 ?? 写入成功后的应答
    public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        guard let data = characteristic.value else {
            return
        }
        let dataDic = String(data: data, encoding: .utf8)
        print("characteristic uuid = \(characteristic.uuid) dataDic - \(dataDic ?? "data error")")
//        guard let dataDic = try? JSONSerialization.jsonObject(with: data, options: []) else {
//            print("从外设读取数据 解析失败")
//            return
//        }
//        print("从外设读取数据 解析成功 - \(dataDic)")
    }
}
