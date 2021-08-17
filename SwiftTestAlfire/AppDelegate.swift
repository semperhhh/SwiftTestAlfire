//
//  AppDelegate.swift
//  SwiftTestAlfire
//
//  Created by zhangpenghui on 2021/6/13.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UITableView().swizzle()
        
        let router = AppRouter.shared
        router.register(path: "Second", navigator: SecondNavigating())
        router.register(path: "Music", navigator: MusicNavigating())
        router.register(path: "Movie", navigator: MovieNavigating())
        router.register(path: "Dark", navigator: DarkNavigating())
        router.register(path: "International", navigator: InternationalNavigating())
        router.register(path: "Mp3", navigator: Mp3Navigating())
        router.register(path: "Bluetooth", navigator: BluetoothNavigatng())
    
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

