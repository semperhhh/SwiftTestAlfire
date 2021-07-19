//
//  MusicTableViewCell.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/28.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    var model: MusicModel? {
        didSet {
            guard let m = model else {
                return
            }
            nameLab.text = m.name
            imgView.kf.setImage(with: URL(string: m.image))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(nameLab)
        self.contentView.addSubview(imgView)
        nameLab.snp.makeConstraints { (m) in
            m.top.equalTo(8)
            m.left.equalTo(15)
            m.right.equalTo(imgView.snp.left).offset(-15)
        }
        imgView.snp.makeConstraints { (m) in
            m.right.equalTo(-15)
            m.top.equalTo(8)
            m.bottom.equalTo(-8)
            m.size.equalTo(CGSize(width: 64, height: 64))
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
        v.textColor = .random
        v.text = "name"
        v.font = UIFont.designKit.subTitle
        v.numberOfLines = 3
        return v
    }()
    
    lazy var imgView: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = .random
        v.asAvatar()
        return v
    }()
}
