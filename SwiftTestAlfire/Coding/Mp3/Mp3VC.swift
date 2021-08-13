//
//  Mp3VC.swift
//  SwiftTestAlfire
//
//  Created by zph on 2021/7/26.
//

import Foundation
import UIKit
import AVFAudio

struct Mp3Navigating: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        self.navigate(to: Mp3VC(), from: viewController, using: transitionType)
    }
}

class Mp3VC: BasicViewController {
    override func viewDidLoad() {
        view.backgroundColor = .designKit.white
        
        addNavigationNormal(true, title: "音频")
        
        // 音频会话(管理与获取iOS设备音频的硬件信息) 单例
        let audioSession = AVAudioSession.sharedInstance()
        // 根据我们需要硬件设备提供的能力来设置类别
        do {
            try audioSession.setCategory(.playAndRecord)
        } catch {
            print("error")
        }
        // 设置i/o的Buffer,越小说明延迟越低
        
    }
}
