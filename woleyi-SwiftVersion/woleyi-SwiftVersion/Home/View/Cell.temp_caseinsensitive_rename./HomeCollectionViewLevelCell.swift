//
//  HomeCollectionViewLevelCell.swift
//  woleyi-SwiftVersion
//
//  Created by ENERGY on 2019/9/23.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import UIKit

class HomeCollectionViewLevelCell: UICollectionViewCell {
    lazy var collectionView : UICollectionView = {
        var layout  = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: CGFloat(self.contentView.frame.size.height - 50/WIDTH_6_SCALE)), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.ColorHex("f2f2f4")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionViewLevelCellCell.self, forCellWithReuseIdentifier: NSStringFromClass(HomeCollectionViewLevelCellCell.self))
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    lazy var titleLab : UILabel = {
        var titleLab = UILabel.init(frame: CGRect(x: 16/WIDTH_6_SCALE, y: self.collectionView.frame.size.height, width: 150/WIDTH_6_SCALE, height: self.frame.size.height - self.collectionView.frame.size.height))
        titleLab.text = "精选好课"
        titleLab.font = UIFont.systemFont(ofSize: 18)
        titleLab.textAlignment = .left
        return titleLab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.collectionView)
        self.contentView.addSubview(self.titleLab)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeCollectionViewLevelCell : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HomeCollectionViewLevelCellCell.self), for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(140/WIDTH_6_SCALE), height: CGFloat(self.contentView.frame.size.height - self.titleLab.frame.size.height) - CGFloat(20/WIDTH_6_SCALE))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: CGFloat(16/WIDTH_6_SCALE), bottom: 0, right: CGFloat(16/WIDTH_6_SCALE))
    }
}
