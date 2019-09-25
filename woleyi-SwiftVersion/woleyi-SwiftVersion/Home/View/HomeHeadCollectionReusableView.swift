//
//  HomeHeadCollectionReusableView.swift
//  woleyi-SwiftVersion
//
//  Created by ENERGY on 2019/9/21.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import UIKit

class HomeHeadCollectionReusableView: UICollectionReusableView {
    public var cycleViewBlock : ((Int) -> ())?
    lazy var cycleView : ZCycleView = {
        var cycleView = ZCycleView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 150/WIDTH_6_SCALE))
        cycleView.setUrlsGroup(["http://t.cn/RYVfQep",
                                "http://t.cn/RYVfgeI",
                                "http://t.cn/RYVfsLo",
                                "http://t.cn/RYMuvvn",
                                "http://t.cn/RYVfnEO",
                                "http://t.cn/RYVf1fd"])
        cycleView.delegate =  self
        cycleView.timeInterval = 2
        return cycleView
    }()
    lazy var grayBGView : UIView = {
        var grayBGViewY = self.cycleView.frame.size.height + self.cycleView.frame.origin.y + 20/WIDTH_6_SCALE
        var grayBGView = UIView.init(frame: CGRect(x: 0, y: grayBGViewY, width: SCREEN_WIDTH, height: 30/WIDTH_6_SCALE))
        grayBGView.backgroundColor = UIColor.ColorHex("F2F2F4")
        return grayBGView
    }()
    lazy var headLineView : UIImageView = {
        var headLineViewY = self.cycleView.frame.size.height + self.cycleView.frame.origin.y + 20/WIDTH_6_SCALE
        var headLineView = UIImageView.init(frame: CGRect(x: 16/WIDTH_6_SCALE, y: headLineViewY, width: 90/WIDTH_6_SCALE, height: 18/WIDTH_6_SCALE))
        headLineView.center.y = self.grayBGView.center.y
        headLineView.image = UIImage.init(named: "headLine")
        return headLineView
    }()
    lazy var scrollTitleView : RTCycleView = {
        var scrollTitleViewX = self.headLineView.frame.size.width + self.headLineView.frame.origin.x + 10/WIDTH_6_SCALE
        var scrollTitleView = RTCycleView.init(frame: CGRect(x: scrollTitleViewX, y: self.headLineView.frame.origin.y, width: SCREEN_WIDTH - scrollTitleViewX, height: self.headLineView.frame.size.height))
        //设置滚动方向 默认向上滚动
        scrollTitleView.upOrdown = .up
        //是否单行显示
        scrollTitleView.isSingleLine = true
        //设置滚动时间间隔
        scrollTitleView.autoScrollTimeInterval = 2.0
        //装载数据源 此处装载dataSource 根据数据结构来选择
//        scrollTitleView.dataSource = ["一去二三里","烟村四五家","亭台六七座","八九十枝花"]
        scrollTitleView.backgroundColor = UIColor.ColorHex("F2F2F4")
        scrollTitleView.center.y = self.headLineView.center.y
        return scrollTitleView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.cycleView)
        self.addSubview(self.grayBGView)
        self.addSubview(self.headLineView)
        self.addSubview(self.scrollTitleView)
        self.backgroundColor = .white
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeadCollectionReusableView : ZCycleViewProtocol{
    func cycleViewDidScrollToIndex(_ index: Int) {
        
    }
    func cycleViewDidSelectedIndex(_ index: Int) {
        self.cycleViewBlock!(index)
    }
}
