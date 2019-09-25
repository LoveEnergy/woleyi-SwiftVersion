//
//  HomeSwiperViewModel.swift
//  woleyi-SwiftVersion
//
//  Created by ENERGY on 2019/9/24.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import UIKit

class HomeSwiperViewModel: NSObject {
    lazy var swiperPicArr : [String] = [String]()
    lazy var headLineArr : [String] = [String]()
    lazy var headLineIDArr : [String] = [String]()
}

//网络 接口
extension HomeSwiperViewModel{
    //轮播图
    func swiperPicData(finishCallBack : @escaping ()->()){
        HttpNetworkTools.requestData(type: .GET, parameter: ["position":"0"], urlString: "Ad/index") { (result) in
            guard let resultDic = result as? [String :  NSObject] else{
                print("解析失败")
                return
            }
//            guard String(describing: resultDic["code"]!) == "1" else{ return }//提示message
//            if resultDic["code"]! as! NSNumber == 1{
//                print("数据解析成功")
//            }
            guard resultDic["code"]! as! NSNumber == 1 else{
                print("数据出错")
                return
            }
            guard let dataArr = resultDic["datas"] as? [[String : NSObject]] else { return }
            for dict in dataArr{
                guard let thumbString = dict["thumb"] as? String else{ return }
                self.swiperPicArr.append(thumbString)
            }
            finishCallBack()
        }
    }
    //滚动新闻
    func newsData(finishCallBack : @escaping ([String], [String])->()){
        HttpNetworkTools.requestData(type: .GET, urlString: "News/index") { (result) in
            guard let resultDic = result as? [String :  NSObject] else{ return }
            guard resultDic["code"]! as! NSNumber == 1 else{ return }
            guard let dataArr = resultDic["datas"] as? [[String : NSObject]] else { return }
            for dict in dataArr{
                guard let titleString = dict["tips"] as? String else{ return }
                guard let idString = dict["id"] as? NSNumber else { return }
                self.headLineArr.append(titleString)
                self.headLineIDArr.append("\(idString)")
            }
            finishCallBack(self.headLineArr, self.headLineIDArr)
        }
    }
    //艺术分类
    func classTypeData(finishCallBack : @escaping ([[String : NSObject]])->()){
        HttpNetworkTools.requestData(type: .GET, parameter: ["type":"0", "level":"0"], urlString: "Category/index") { (result) in
            guard let resultDic = result as? [String :  NSObject] else{ return }
            guard resultDic["code"]! as! NSNumber == 1 else{ return }
            guard let dataArr = resultDic["datas"] as? [[String : NSObject]] else { return }
            finishCallBack(dataArr)
        }
    }
}

