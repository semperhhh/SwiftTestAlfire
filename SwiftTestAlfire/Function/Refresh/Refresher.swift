//
//  Refreshing.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/19.
//

import UIKit
import MJRefresh

class Refresher {
    
    class func headerRefresh(targer: Any, action: Selector) -> MJRefreshNormalHeader {
        let header = MJRefreshNormalHeader(refreshingTarget: targer, refreshingAction: action)
        header.lastUpdatedTimeLabel?.isHidden = true
        header.setTitle("下拉更新..", for: .idle)
        header.setTitle("准备更新..", for: .pulling)
        header.setTitle("更新中..", for: .refreshing)
        return header
    }
    
    class func footerRefresh(targer: Any, action: Selector) -> MJRefreshBackNormalFooter {
        let footer = MJRefreshBackNormalFooter(refreshingTarget: targer, refreshingAction: action)
        footer.setTitle("上拉更新..", for: .idle)
        footer.setTitle("准备更新..", for: .pulling)
        footer.setTitle("更新中..", for: .refreshing)
        return footer
    }
}
