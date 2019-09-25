//
//  HomeCollectionViewClassifyCell.swift
//  woleyi-SwiftVersion
//
//  Created by ENERGY on 2019/9/23.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import UIKit

class HomeCollectionViewClassifyCell: UICollectionViewCell {
    lazy var iconImg : UIImageView = {
        let iconImgW = 47/WIDTH_6_SCALE
        var iconImg = UIImageView.init(frame: CGRect(x: 0, y: 0, width: iconImgW, height: iconImgW))
        iconImg.center.x = self.contentView.center.x
        iconImg.backgroundColor = .orange
        iconImg.layer.cornerRadius = CGFloat(16)
        iconImg.layer.masksToBounds = true
        return iconImg
    }()
    lazy var titleLab : UILabel = {
        let titleLabY = self.iconImg.frame.size.height + self.iconImg.frame.origin.y
        var titleLab = UILabel.init(frame: CGRect(x: 0, y: titleLabY + 8/WIDTH_6_SCALE, width: self.contentView.frame.size.width, height: self.getTextHeigh(textStr: "标题", font: UIFont.systemFont(ofSize: 12), width: self.contentView.frame.size.width)))
        titleLab.text = "标题"
        titleLab.font = UIFont.systemFont(ofSize: 12)
        titleLab.textAlignment = .center
        return titleLab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.iconImg)
        self.contentView.addSubview(self.titleLab)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeCollectionViewClassifyCell{
    func getTextHeigh(textStr :  String, font : UIFont, width : CGFloat)  -> CGFloat{
        let normalText : NSString = textStr as NSString
        let size = CGSize(width: width, height:1000)   //CGSizeMake(width,1000)
        let dic = NSDictionary(object: font, forKey : kCTFontAttributeName as! NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key:Any], context:nil).size
        return  stringSize.height
    }
}
