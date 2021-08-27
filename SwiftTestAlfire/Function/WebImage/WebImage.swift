//
//  WebImage.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/8/27.
//

import UIKit

protocol WebImageViewing {
    
}

struct WebImageView: WebImageViewing {
    
    func setImage(str: String) {
        self.imageView.kf.setImage(with: URL(string: str))
    }
    
    internal var imageView: UIImageView
    internal init(imgView: UIImageView) {
        self.imageView = imgView
    }
}

extension UIImageView {
    var web: WebImageView {
        WebImageView(imgView: self)
    }
}
