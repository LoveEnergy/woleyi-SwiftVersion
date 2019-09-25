//
//  Config.swift
//  SwiftTest
//
//  Created by ENERGY on 2019/7/31.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import Foundation
import UIKit
//屏幕宽高
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
//判断机型
let Is_Iphone = (UI_USER_INTERFACE_IDIOM() == .phone)
let Is_Iphone_X = (Is_Iphone && SCREEN_HEIGHT >= 812.0)
let NAVI_HEIGHT = (Is_Iphone_X ? 88 : 64)
let TABBAR_HEIGHT =  (Is_Iphone_X ? 83 : 49)
let BOTTOM_HEIGHT = (Is_Iphone_X ? 34 : 0)
//5S宽高比例
let ScreenBounds = UIScreen.main.bounds
let WIDTH_5S_SCALE = 320.0 / UIScreen.main.bounds.size.width
let HEIGHT_5S_SCALE = 568.0 / UIScreen.main.bounds.size.height
//let WIDTH_6_SCALE = 375.0 / UIScreen.main.bounds.size.width
let WIDTH_6_SCALE = Is_Iphone_X ? 414 / UIScreen.main.bounds.size.width : 375.0 / UIScreen.main.bounds.size.width
let HEIGHT_6_SCALE = 667.0 / UIScreen.main.bounds.size.height
//通用字号
let DEF_FontSize_26 = UIFont.systemFont(ofSize: 26)
let DEF_FontSize_18 = UIFont.systemFont(ofSize: 18)
let DEF_FontSize_17 = UIFont.systemFont(ofSize: 17)
let DEF_FontSize_16 = UIFont.systemFont(ofSize: 16)
let DEF_FontSize_15 = UIFont.systemFont(ofSize: 15)
let DEF_FontSize_14 = UIFont.systemFont(ofSize: 14)
let DEF_FontSize_13 = UIFont.systemFont(ofSize: 13)
let DEF_FontSize_12 = UIFont.systemFont(ofSize: 12)
let DEF_FontSize_11 = UIFont.systemFont(ofSize: 11)
let DEF_FontSize_10 = UIFont.systemFont(ofSize: 10)
let DEF_FontSize_9 = UIFont.systemFont(ofSize: 9)
let DEF_FontSize_8 = UIFont.systemFont(ofSize: 8)
