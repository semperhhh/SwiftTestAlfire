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
        
        audioSessionActive()
        
        let ioUnit: AudioUnit = createAudioUnit()
        connectSpeaker(remoteIOUnit: ioUnit)        // element0的output连接扬声器
        connectMicrophone(remoteIOUnit: ioUnit)     // element1的input连接麦克风
        // 给audioUnit设置数据格式(分为输入和输出两个部分)
        // 音视频的具体格式
        
        
    }
    
    /// audio stream format的描述
    func createAudioStreamFormat() {
        let bytesPerSample: UInt32 = UInt32(MemoryLayout.size(ofValue: Float32()))
        var asbd: AudioStreamBasicDescription!
        bzero(&asbd, MemoryLayout.size(ofValue: asbd))
        asbd.mFormatID = kAudioFormatLinearPCM
//        asbd.mSampleRate = _sampleRate
//        asbd.mChannelsPerFrame = channels
        asbd.mFramesPerPacket = 1
        asbd.mFormatFlags = kAudioFormatFlagsNativeFloatPacked | kAudioFormatFlagIsNonInterleaved
        asbd.mBitsPerChannel = 8 * bytesPerSample
        asbd.mBytesPerFrame = bytesPerSample
        asbd.mBytesPerPacket = bytesPerSample
    }
    
    /// 使用麦克风
    func connectMicrophone(remoteIOUnit: AudioUnit) {
        let busOne: UInt32 = 1
        var oneFlag: UInt32 = 1
        AudioUnitSetProperty(remoteIOUnit, kAudioOutputUnitProperty_EnableIO, kAudioUnitScope_Input, busOne, &oneFlag, UInt32(MemoryLayout.size(ofValue: oneFlag)))
    }
    
    /// 使用扬声器
    func connectSpeaker(remoteIOUnit: AudioUnit) {
        var status: OSStatus = noErr
        var oneFlag: UInt32 = 1
        let busZero: UInt32 = 0 // Element0
        status = AudioUnitSetProperty(remoteIOUnit, kAudioOutputUnitProperty_EnableIO, kAudioUnitScope_Output, busZero, &oneFlag, UInt32(MemoryLayout.size(ofValue: oneFlag)))
//        CheckStatus(status, "", true) // 自定义函数
        
    }
    
    func createAudioUnit() -> AudioUnit {
        
        // 类型（Type）、子类型（subtype）以及厂商（Manufacture）
        
        // RemoteIO类型的audioUnit描述的结构体
        var ioUnitInstance: AudioComponentDescription = AudioComponentDescription()
        ioUnitInstance.componentType = kAudioUnitType_Output
        ioUnitInstance.componentSubType = kAudioUnitSubType_RemoteIO
        ioUnitInstance.componentManufacturer = kAudioUnitManufacturer_Apple //厂商
        ioUnitInstance.componentFlags = 0
        ioUnitInstance.componentFlagsMask = 0
        
        // 声明并且实例化一个AUGraph
        var processingGraph: AUGraph!
        NewAUGraph(&processingGraph)
        
        // 增加一个AUNode
        var ioNode: AUNode!
        AUGraphAddNode(processingGraph, &ioUnitInstance, &ioNode)
        
        // 打开AUGraph, 也是间接实例化AUGraph中所有的AUNode
        // 必须在获取AudioUnit之前打开,否则将不能从对应的AUNode中获取正确的AudioUnit
        AUGraphOpen(processingGraph)
        
        // 在AUGraph中的某个Node里获得AudioUnit的引用：
        var ioUnit: AudioUnit!
        AUGraphNodeInfo(processingGraph, ioNode, nil, &ioUnit)
        
        return ioUnit
    }
    
    func audioSessionActive() {
        // 音频会话(管理与获取iOS设备音频的硬件信息) 单例
        let audioSession = AVAudioSession.sharedInstance()
        
        // 根据我们需要硬件设备提供的能力来设置类别
        do {
            try audioSession.setCategory(.playAndRecord)
        } catch {
            print("error")
        }
        
        // 设置i/o的Buffer,越小说明延迟越低
        let bufferDuration: TimeInterval = 0.002
        do {
            try audioSession.setPreferredIOBufferDuration(bufferDuration)
        } catch {
            print("error")
        }
        
        // 设置采样频率,让硬件设备按照设置的采样频率来采集或者播放音频
        let hwSampleRate: Double = 44100.0
        do {
            try audioSession.setPreferredSampleRate(hwSampleRate)
        } catch {
            print("error")
        }
        
        // 激活audioSession
        do {
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("error")
        }
    }
}
