//
//  NavigationView.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/3.
//

import UIKit

protocol NavigationViewDelegate {
    
    /// 默认返回按钮点击
    func navigationBackButtonAction()
    /// 默认右边按钮点击
    func navigationRightButtonAction()
}

class NavigationView: UIView {
    
    var NavigationCenterY: CGFloat = kStatusBarHeight + 22;
    
    // FIXME: 要不要用weak
    var navigationViewDelegate: NavigationViewDelegate?
    
    init(hasBackButton: Bool) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .designKit.white
        if hasBackButton {
            addNavigationBackBtn()
        }
        setupUIView()
    }
    
    convenience init() {
        self.init(hasBackButton: false)
    }
    
    /// 子类重写
    func setupUIView() {
    
    }
    
    /// 添加分割线
    func addNavigationSplitLine() {
        self.addSubview(splitLine)
        splitLine.snp.makeConstraints { m in
            m.bottom.left.right.equalToSuperview()
            m.height.equalTo(0.5)
        }
    }
    
    /// 添加返回按钮
    func addNavigationBackBtn() {
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { m in
            m.centerY.equalTo(NavigationCenterY)
            m.left.equalTo(15)
            m.size.equalTo(CGSize(width: 16, height: 16))
        }
    }
    
    func addNavigationRightBtn(_ title: String) {
        let v = UIButton()
        v.setTitle(title, for: .normal)
        v.setTitleColor(.designKit.color222222, for: .normal)
        v.titleLabel?.font = .designKit.subTitle
        v.addTarget(self, action: #selector(rightBtnAction), for: .touchUpInside)
        addNavigationRightBtn(v)
    }
    
    func addNavigationRightBtn(_ image: UIImage) {
        let v = UIButton()
        v.setImage(image, for: .normal)
        v.addTarget(self, action: #selector(rightBtnAction), for: .touchUpInside)
        addNavigationRightBtn(v)
    }
    
    /// 添加右侧按钮
    func addNavigationRightBtn(_ rightBtn: UIView) {
        self.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { m in
            m.centerY.equalTo(NavigationCenterY)
            m.right.equalTo(-15)
        }
    }
    
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
    
    @objc func rightBtnAction() {
        navigationViewDelegate?.navigationRightButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class NavigationNormalView: NavigationView {
    
    override func setupUIView() {
        addNavigationTitleLabel()
        addNavigationSplitLine()
    }
    
    /// 添加标题文本
    func addNavigationTitleLabel(_ title: String = "") {
        titleLabel.text = title
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { m in
            m.centerY.equalTo(NavigationCenterY)
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
}

class NavigationSearchView: NavigationView {
    
    typealias SearchCallback = (() -> Void)
    
    /// 搜索回调
    var searchActionCallback: SearchCallback?
    
    override func setupUIView() {
        addNavigationSearch()
        addNavigationSplitLine()
    }
    
    func addNavigationSearch() {
        addSubview(searchButton)
        searchButton.snp.makeConstraints { m in
            m.centerY.equalTo(NavigationCenterY)
            m.centerX.equalToSuperview()
            m.height.equalTo(32)
            m.width.equalTo(kScreenWidth - 120)
        }
    }
    
    // MARK: lazy
    lazy var searchButton: UIButton = {
        let v = UIButton()
        v.setTitle(L10n.Localizable.searchKey, for: .normal)
        v.setTitleColor(.designKit.color999999, for: .normal)
        v.titleLabel?.font = .designKit.subTitle
        v.backgroundColor = .designKit.F5F7F9Card
        v.asAvatar(cornerRadius: 10)
        v.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        return v
    }()
    
    @objc func searchButtonAction() {
        searchActionCallback?()
    }
}
