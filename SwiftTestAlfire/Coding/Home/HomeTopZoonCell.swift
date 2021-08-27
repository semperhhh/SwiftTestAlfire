//
//  HomeTopZoonCell.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/20.
//

import UIKit
import DesignKit

struct HomeTopZoonModel {
    var title: String = ""
    var contentUrl: String = ""
}

class HomeTopZoonCell: UITableViewCell {
    
    var model: HomeTopZoonModel? {
        didSet {
            guard let m = model else {
                return
            }
            nameLab.text = m.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initWithNone()
        
        self.backgroundColor = UIColor.designKit.white
        self.contentView.addSubview(nameLab)
        nameLab.snp.makeConstraints { m in
            m.top.equalTo(Spacing.twoExtraSmall)
            m.left.equalTo(Spacing.small)
            m.right.equalTo(-Spacing.small)
            m.bottom.equalTo(-Spacing.twoExtraSmall)
            m.height.equalTo(64)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let m = model else {
            return
        }
        AppRouter.shared.route(to: URL(string: m.contentUrl), from: nil, using: .show)
    }
    
    // MARK: lazy
    lazy var nameLab: UILabel = {
        let v = UILabel()
        v.textColor = UIColor.designKit.color222222
        v.font = UIFont.designKit.title
        v.textAlignment = .center
        v.backgroundColor = UIColor.designKit.EEEEEE
        v.asAvatar()
        return v
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

