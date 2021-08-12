//
//  MusicVC.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/28.
//

import UIKit

struct MusicNavigating: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        self.navigate(to: MusicVC(), from: viewController, using: transitionType)
    }
}


class MusicVC: BasicViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        addNavigationNormal(true, title: L10n.musicKey)
        collectionView.register(MusicCollectionViewCell.self, forCellWithReuseIdentifier: "item")
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (m) in
            m.bottom.left.right.equalToSuperview()
            m.top.equalTo(navigationView!.snp.bottom)
        }
        self.requestData()
    }
    
    // MARK: lazy
    func requestData() {
        
//        MusicData().request { list in
//            self.dataList = list
//            self.tableview.reloadData()
//        }

        MusicData().requestLocal { list in
            self.dataList = list
            self.collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let v = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        v.backgroundColor = UIColor.designKit.white
        v.dataSource = self
        v.delegate = self
        return v
    }()
    
    var dataList: [MusicModel] = []
}

extension MusicVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! MusicCollectionViewCell
        item.model = dataList[indexPath.row]
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 3.0, height: UIScreen.main.bounds.width / 3.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
