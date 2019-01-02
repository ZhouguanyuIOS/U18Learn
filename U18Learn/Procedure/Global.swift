//
//  Global.swift
//  U18Learn
//
//  Created by 周冠羽 on 2018/10/23.
//  Copyright © 2018 周冠羽. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var background: UIColor {
        return UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        
    }
    class var theme: UIColor {
        return UIColor(red: 29/255.0, green: 221/255.0, blue: 43/255.0, alpha: 1)
    }
}

extension String{
    static let searchHistoryKey = "searchHistoryKey"
    static let sexTypeKey = "sexTypeKey"
}



let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

var isIphoneX : Bool {
   // UI_USER_INTERFACE_IDIOM 判断是否为手机
    return UI_USER_INTERFACE_IDIOM() == .phone && (max(screenHeight, screenWidth) == 812 || max(screenHeight, screenWidth) == 896)
}



