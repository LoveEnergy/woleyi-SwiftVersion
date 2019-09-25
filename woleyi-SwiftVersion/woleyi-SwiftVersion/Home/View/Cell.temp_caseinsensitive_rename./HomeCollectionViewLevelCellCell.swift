//
//  HomeCollectionViewLevelCellCell.swift
//  woleyi-SwiftVersion
//
//  Created by ENERGY on 2019/9/23.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import UIKit

class HomeCollectionViewLevelCellCell: UICollectionViewCell {
    lazy var iconImg  : UIImageView = {
        let iconImg = UIImageView.init(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height))
        iconImg.backgroundColor = .red
        iconImg.layer.masksToBounds = true
        iconImg.layer.cornerRadius = 8
        return iconImg
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.iconImg)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
