//
//  MusicTableViewCell.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/28.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    
    var model: MusicModel? {
        didSet {
            guard let m = model else {
                return
            }
            nameLab.text = m.name
            imgView.web.setImage(str: m.image)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(nameLab)
        self.contentView.addSubview(imgView)
        
        imgView.snp.makeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.top.equalTo(8)
            m.size.equalTo(CGSize(width: 64, height: 64))
        }
        nameLab.snp.makeConstraints { (m) in
            m.top.equalTo(imgView.snp.bottom)
            m.bottom.equalTo(-8)
            m.left.equalTo(8)
            m.right.equalTo(-8)
        }
        imgView.asAvatarOfAutoLayout(corners: .topLeft, radius: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var nameLab: UILabel = {
        let v = UILabel()
        v.textColor = UIColor.designKit.color222222
        v.text = "name"
        v.font = UIFont.designKit.subTitle
        v.numberOfLines = 3
        v.textAlignment = .center
        return v
    }()
    
    lazy var imgView: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = .random
//        v.asAvatar()
        return v
    }()
}
