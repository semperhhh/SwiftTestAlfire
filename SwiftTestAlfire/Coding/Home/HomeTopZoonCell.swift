//
//  HomeTopZoonCell.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/20.
//

import UIKit
import DesignKit

struct HomeTopZoonModel: SwiftyJsonModelProtocol {
    init(_ json: JSON) {
        title = json["title"].stringValue
        description = json["description"].stringValue
        contentUrl = json["contentUrl"].stringValue
    }
    
    var title: String = ""
    var description: String = ""
    var contentUrl: String = ""
}

class HomeTopZoonCell: UITableViewCell {
    
    var model: HomeTopZoonModel? {
        didSet {
            guard let m = model else {
                return
            }
            nameLab.text = m.title
            descLab.text = m.description
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initWithNone()
        
        backgroundColor = UIColor.designKit.white
        contentView.addSubview(nameLab)
        contentView.addSubview(descLab)
        contentView.addSubview(splitView)
        
        nameLab.snp.makeConstraints { m in
            m.top.equalTo(Spacing.extraSmall)
            m.left.equalTo(Spacing.sideSpac)
            m.right.lessThanOrEqualTo(-Spacing.sideSpac)
        }
        descLab.snp.makeConstraints { make in
            make.top.equalTo(nameLab.snp.bottom).offset(Spacing.extraSmall)
            make.left.equalTo(Spacing.sideSpac)
            make.right.equalTo(-Spacing.sideSpac)
        }
        splitView.snp.makeConstraints { make in
            make.top.equalTo(descLab.snp.bottom).offset(Spacing.extraSmall)
            make.bottom.equalToSuperview()
            make.left.equalTo(Spacing.sideSpac)
            make.right.equalTo(-Spacing.sideSpac)
            make.height.equalTo(1)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let m = model else {
            return
        }
        AppRouter.shared.route(to: URL(string: m.contentUrl), from: nil, using: .show)
    }
    
    // MARK: lazy
    private lazy var nameLab: UILabel = {
        let v = UILabel()
        v.textColor = UIColor.designKit.color222222
        v.font = UIFont.designKit.title
        return v
    }()
    
    lazy var descLab: UILabel = {
        let v = UILabel()
        v.textColor = .designKit.color666666
        v.font = .designKit.subTitle
        return v
    }()
    
    private lazy var splitView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9332618117, green: 0.9333737493, blue: 0.9332236052, alpha: 1)
        return v
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

