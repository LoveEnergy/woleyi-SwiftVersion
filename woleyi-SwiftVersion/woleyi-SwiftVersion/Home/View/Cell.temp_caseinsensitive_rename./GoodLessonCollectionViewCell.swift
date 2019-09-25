//
//  GoodLessonCollectionViewCell.swift
//  woleyi-SwiftVersion
//
//  Created by ENERGY on 2019/9/23.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import UIKit

class GoodLessonCollectionViewCell: UICollectionViewCell {
    lazy var shadowView : UIView = {
        var shadowView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height))
        shadowView.backgroundColor = .white
        //先边框
        shadowView.layer.borderWidth = 0.3
        shadowView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        //中阴影
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.2//不透明度
        shadowView.layer.shadowRadius = 5.0//设置阴影所照射的范围
        shadowView.layer.shadowOffset = CGSize.init(width: 0, height: 5)// 设置阴影的偏移量
        shadowView.layer.cornerRadius = 8
        return shadowView
    }()
    lazy var iconImg : UIImageView = {
        var iconImg = UIImageView.init(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: 94/WIDTH_6_SCALE))
        iconImg.backgroundColor = .cyan
        iconImg.layer.mask = self.configRectCorner(view: iconImg, corner: [.topRight, .topLeft], radii: CGSize(width: 8, height: 8))
        return iconImg
    }()
    lazy var titleLab : UILabel = {
        var titleLab = UILabel.init(frame: CGRect(x: 5/WIDTH_6_SCALE, y: self.iconImg.frame.size.height + 5/WIDTH_6_SCALE, width: self.contentView.frame.size.width - 10/WIDTH_6_SCALE, height: 15/WIDTH_6_SCALE))
        titleLab.text = "课程名"
        titleLab.textAlignment = .left
        titleLab.font = UIFont.systemFont(ofSize: 12)
        return titleLab
    }()
    lazy var starView : JNStarRateView = {
        var starView = JNStarRateView.init(frame: CGRect(x: self.titleLab.frame.origin.x, y: self.titleLab.frame.size.height + self.titleLab.frame.origin.y + 6/WIDTH_6_SCALE, width: 67/WIDTH_6_SCALE, height: 11/WIDTH_6_SCALE), numberOfStars: 5, currentStarCount: 4)
        starView.isUserInteractionEnabled = false//不支持用户操作
        starView.userPanEnabled = true //滑动
        starView.currentStarCount = 1 //当前显示的评星数
        starView.integerStar = false // 完整星星
        return starView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.shadowView)
        self.contentView.addSubview(self.iconImg)
        self.contentView.addSubview(self.titleLab)
        self.contentView.addSubview(self.starView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GoodLessonCollectionViewCell{
    //部分圆角
    func configRectCorner(view: UIView, corner: UIRectCorner, radii: CGSize) -> CALayer {
        let maskPath = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: corner, cornerRadii: radii)
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = view.bounds
        maskLayer.path = maskPath.cgPath
        return maskLayer
    }
}
