//
//  NavigationView.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/3.
//

import UIKit

protocol NavigationViewing {
    func navigationBackButtonAction()
}

class NavigationView: UIView {
    
    // FIXME: 要不要用weak
    var navigationViewDelegate: NavigationViewing?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .designKit.white
     
        self.addSubview(titleLabel)
        self.addSubview(splitLine)
        titleLabel.snp.makeConstraints { m in
            m.bottom.equalTo(-8)
            m.centerX.equalToSuperview()
        }
        splitLine.snp.makeConstraints { m in
            m.bottom.left.right.equalToSuperview()
            m.height.equalTo(0.5)
        }
    }
    
    /// 添加返回按钮
    func addNavigationBackBtn() {
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { m in
            m.centerY.equalTo(titleLabel)
            m.left.equalTo(15)
            m.size.equalTo(CGSize(width: 20, height: 20))
        }
    }
    
    /// 添加右侧按钮
    func addNavigationRightBtn() {
        
    }
    
    // MARK: lazy
    var titleLabel: UILabel = {
        let v = UILabel()
        v.font = .designKit.title
        v.text = "title"
        v.textColor = .designKit.color222222
        return v
    }()
    
    /// 返回按钮
    lazy var backBtn: UIButton = {
        let v = UIButton()
        v.setImage(#imageLiteral(resourceName: "app_backButton"), for: .normal)
        v.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        return v
    }()
    
    /// 分割线
    lazy var splitLine: UIView = {
        let v = UIView()
        v.backgroundColor = .designKit.EEEEEE
        return v
    }()

    
    @objc func backBtnAction() {
        navigationViewDelegate?.navigationBackButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
