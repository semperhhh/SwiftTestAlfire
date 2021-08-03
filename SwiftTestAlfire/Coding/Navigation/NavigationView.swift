//
//  NavigationView.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/3.
//

import UIKit

class NavigationView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .designKit.white
     
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { m in
            m.bottom.equalTo(-8)
            m.centerX.equalToSuperview()
        }
    }
    
    // MARK: lazy
    var titleLabel: UILabel = {
        let v = UILabel()
        v.font = .designKit.title
        v.text = "title"
        v.textColor = .designKit.color222222
        return v
    }()
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
