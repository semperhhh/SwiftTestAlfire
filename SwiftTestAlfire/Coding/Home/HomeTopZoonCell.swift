//
//  HomeTopZoonCell.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/20.
//

import UIKit

struct HomeTopZoonModel {
    var title: String = ""
    var contentUrl: String = ""
}

class HomeTopZoonCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! HomeTopZoonItem
        item.model = modelList[indexPath.row]
        return item
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 2, height: 96)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }
    
    var modelList: [HomeTopZoonModel] = [] {
        didSet {
            collectionview.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(collectionview)
        collectionview.snp.makeConstraints { m in
            m.top.left.right.equalToSuperview()
            m.height.equalTo(96 * 2)
            m.bottom.equalToSuperview()
        }
    }
    
    // MARK: lazy
    lazy var collectionview : UICollectionView = {
        let f = UICollectionViewFlowLayout()
        let v = UICollectionView(frame: CGRect.zero, collectionViewLayout: f)
        v.backgroundColor = UIColor.designKit.white
        v.delegate = self
        v.dataSource = self
        v.register(HomeTopZoonItem.self, forCellWithReuseIdentifier: "item")
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

class HomeTopZoonItem: UICollectionViewCell {
    
    var model: HomeTopZoonModel? {
        didSet {
            guard let m = model else {
                return
            }
            nameLab.text = m.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.designKit.white
        self.contentView.addSubview(nameLab)
        nameLab.snp.makeConstraints { m in
            m.top.left.equalTo(5)
            m.right.equalTo(-5)
            m.bottom.equalToSuperview()
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
