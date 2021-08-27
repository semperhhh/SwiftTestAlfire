//
//  MovieTableViewCell.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/7/19.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var model: MovieModel? {
        didSet {
            guard let m = model else {
                return
            }
            imgView.web.setImage(str: m.imageUrl)
            nameLab.text = m.title
            subNameLab.text = m.subTitle
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(nameLab)
        self.contentView.addSubview(subNameLab)
        self.contentView.addSubview(splitView)
        
        imgView.snp.makeConstraints { (m) in
            m.right.equalTo(-15)
            m.size.equalTo(CGSize(width: 100, height: 148))
            m.top.equalTo(8)
        }
        nameLab.snp.makeConstraints { (m) in
            m.left.equalTo(15)
            m.top.equalTo(8)
            m.right.equalTo(imgView.snp.left).offset(-8)
        }
        subNameLab.snp.makeConstraints { (m) in
            m.left.equalTo(nameLab)
            m.right.equalTo(imgView.snp.left).offset(-8)
            m.top.equalTo(nameLab.snp.bottom).offset(8)
        }
        splitView.snp.makeConstraints { (m) in
            m.top.equalTo(imgView.snp.bottom).offset(8)
            m.left.equalTo(15)
            m.right.equalTo(-15)
            m.height.equalTo(1)
            m.bottom.equalToSuperview()
        }
    }
    
    // MARK: lazy
    lazy var imgView: UIImageView = {
        let v = UIImageView()
        v.asAvatar()
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    lazy var nameLab: UILabel = {
        let v = UILabel()
        v.text = "标题"
        v.numberOfLines = 0
        v.textColor = UIColor.designKit.color222222
        v.font = UIFont.designKit.title
        return v
    }()
    
    lazy var subNameLab: UILabel = {
        let v = UILabel()
        v.text = "子标题"
        v.numberOfLines = 0
        v.textColor = UIColor.designKit.color222222
        v.font = UIFont.designKit.subTitle
        return v
    }()
    
    private lazy var splitView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.designKit.EEEEEE
        return v
    }()
    
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

}
