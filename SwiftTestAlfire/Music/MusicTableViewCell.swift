//
//  MusicTableViewCell.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/28.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .random
        self.contentView.addSubview(nameLab)
        self.contentView.addSubview(imgView)
        nameLab.snp.makeConstraints { (m) in
            m.top.equalTo(8)
            m.left.equalTo(15)
        }
        imgView.snp.makeConstraints { (m) in
            m.right.equalTo(-15)
            m.top.equalTo(8)
            m.bottom.equalTo(-8)
            m.size.equalTo(CGSize(width: 44, height: 44))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    lazy var nameLab: UILabel = {
        let v = UILabel()
        v.backgroundColor = .random
        v.text = "name"
        v.font = UIFont.designKit.subTitle
        return v
    }()
    
    lazy var imgView: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = .random
        v.asAvatar()
        return v
    }()
}
