//
//  InternationalCell.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/13.
//

import UIKit

class InternationalCell: UITableViewCell {
    
    func cellSelect(_ isSelect: Bool) {
        if isSelect {
            configBtn.isHidden = false
        } else {
            configBtn.isHidden = true
        }
    }
    
    var model: InternationalModel? {
        didSet {
            guard let m = model else {
                return
            }
            titleLab.text = m.name
            configBtn.isHidden = !m.isSelect
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initWithNone()
        contentView.addSubview(titleLab)
        contentView.addSubview(configBtn)
        titleLab.snp.makeConstraints { m in
            m.left.equalTo(Spacing.small)
            m.top.bottom.equalToSuperview()
            m.height.equalTo(44)
        }
        configBtn.snp.makeConstraints { m in
            m.centerY.equalTo(titleLab)
            m.right.equalTo(-Spacing.small)
            m.size.equalTo(CGSize(width: 44, height: 44))
        }
    }
    
    // MARK: lazy
    var titleLab: UILabel = {
        let v = UILabel()
        v.textColor = .designKit.color222222
        v.font = .designKit.subTitle
        return v
    }()
    
    lazy var configBtn: UIButton = {
        let v = UIButton()
        v.setImage(.init(named: "dark_config"), for: .normal)
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
