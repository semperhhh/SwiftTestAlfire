//
//  BluetoothCell.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/23.
//

import UIKit
import Foundation
import DesignKit
import CoreBluetooth

class BluetoothCell: UITableViewCell {

    var model: CBPeripheral? {
        didSet {
            guard let m = model else {
                return
            }
            nameLabel.text = m.name
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initWithNone()
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { m in
            m.left.equalTo(Spacing.sideSpac)
            m.centerY.equalToSuperview()
            m.right.equalTo(-Spacing.sideSpac)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var nameLabel: UILabel = {
        let v = UILabel()
        v.text = "name"
        return v
    }()
}
