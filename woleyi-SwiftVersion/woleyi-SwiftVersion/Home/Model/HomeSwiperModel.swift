//
//  HomeSwiperModel.swift
//  woleyi-SwiftVersion
//
//  Created by ENERGY on 2019/9/24.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import UIKit

class HomeSwiperModel: NSObject {
    //轮播图id
    var id : String = ""
    //轮播图图片地址
    var thumb : String = ""
    //名称
    var name : String = ""
    //跳转类型
    var to_id : String = ""
    //类型
    var type : String = ""
    
    
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
