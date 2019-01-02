//
//  AppDelegate.swift
//  U18Learn
//
//  Created by 周冠羽 on 2018/10/23.
//  Copyright © 2018 周冠羽. All rights reserved.
//

import UIKit
import Alamofire
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //初始化网络
    lazy var reachability: NetworkReachabilityManager? = {
        return NetworkReachabilityManager(host: "http://app.u17.com")
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configBase() //设置基本（键盘和 移动数据检测）
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor =  UIColor.white
        window?.rootViewController = UITabBarController()
        window?.makeKeyAndVisible()
        
        setStaticGuidePage()
        return true
    }
    func configBase() {
        //关闭设置为false,打开IQKeyboard
        IQKeyboardManager.shared.enable = true
        //如果产品需要当键盘弹起时，点击背景收起键盘
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        
        let defaults = UserDefaults.standard
        if (defaults.value(forKey: String.sexTypeKey) == nil){
            defaults.set(1, forKey: String.sexTypeKey)
            defaults.synchronize()
        }
        //监听网络
        reachability?.listener = {
            status  in
            print(status)
            switch status {
            
//            case .reachable(.ethernetOrWiFi):
//                UNoticeBar(config: UNoticeBarConfig(title:"主人，检测到您正在使用WIFI数据")).show(duration: 2)
//                break
            case .reachable(.wwan):
                UNoticeBar(config: UNoticeBarConfig(title:"主人，检测到您正在使用移动数据")).show(duration: 2)
                break
//            case .notReachable:
//                UNoticeBar(config: UNoticeBarConfig(title:"无网络连接")).show(duration: 2)
//                break
//            case .unknown:
//                UNoticeBar(config: UNoticeBarConfig(title:"未知的网络连接")).show(duration: 2)
//                break
            default:
                break
            }
        }
        reachability?.startListening()
    }
    func setStaticGuidePage()  {
        let imageNameArray : [String] = ["lead01","lead02","lead03"]
        let guideView = HHGuidePageHUD.init(imageNameArray: imageNameArray, isHiddenSkipButton: false)
        self.window?.rootViewController?.view .addSubview(guideView)
        
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

