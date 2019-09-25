//
//  HomeViewController.swift
//  woleyi-SwiftVersion
//
//  Created by ENERGY on 2019/9/21.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    lazy var homeSwiperVM : HomeSwiperViewModel = HomeSwiperViewModel()
    lazy var swiperIDArr : [String] = [String]()
    lazy var newsIDArr :  [String] = [String]()
    lazy var newsContentArr :  [String] = [String]()
    lazy var classTypeArr : [[String : NSObject]] = [[String : NSObject]]()
    lazy var collectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: SCREEN_WIDTH / 2 - 20/WIDTH_6_SCALE, height: 50/WIDTH_6_SCALE)
        var collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: CGFloat(SCREEN_WIDTH), height: CGFloat(SCREEN_HEIGHT) - CGFloat(TABBAR_HEIGHT)), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(UICollectionViewCell.self))
        collectionView.register(HomeHeadCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(HomeHeadCollectionReusableView.self))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(UICollectionReusableView.self))
        collectionView.register(HomeCollectionViewClassifyCell.self, forCellWithReuseIdentifier: NSStringFromClass(HomeCollectionViewClassifyCell.self))
        collectionView.register(HomeCollectionViewLevelCell.self, forCellWithReuseIdentifier: NSStringFromClass(HomeCollectionViewLevelCell.self))
        collectionView.register(GoodLessonCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(GoodLessonCollectionViewCell.self))
        
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        if #available(iOS 11.0, *) {
//            self.collectionView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
//        } else {
//            // Fallback on earlier versions
//            self.automaticallyAdjustsScrollViewInsets = false
//        }
        self.view.addSubview(self.collectionView)
        self.loadNetworkData()
    }
}
//collectionView代理
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let noneCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(UICollectionViewCell.self), for: indexPath)
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HomeCollectionViewClassifyCell.self), for: indexPath)
            return cell
        }
        if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HomeCollectionViewLevelCell.self), for: indexPath)
            return cell
        }
        if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(GoodLessonCollectionViewCell.self), for: indexPath)
            return cell
        }
        return noneCell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return self.classTypeArr.count
        }
        if section == 1{
            return 1
        }
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0{
            let headerView : HomeHeadCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(HomeHeadCollectionReusableView.self), for: indexPath) as! HomeHeadCollectionReusableView
            headerView.cycleView.setUrlsGroup(self.homeSwiperVM.swiperPicArr)
            headerView.scrollTitleView.dataSource = self.newsContentArr
            headerView.cycleViewBlock = {(selectID) in
                print("\(selectID)")
            }
            return headerView
        }else{
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(UICollectionReusableView.self), for: indexPath)
            return headerView
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
            return CGSize(width: SCREEN_WIDTH, height: 220)
        }else{
            return CGSize(width: SCREEN_WIDTH, height: 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return  CGSize(width: CGFloat((SCREEN_WIDTH)/5), height: CGFloat(191/WIDTH_6_SCALE/2))
        }
        if indexPath.section == 1 {
            return CGSize(width: CGFloat(SCREEN_WIDTH), height: CGFloat(120/WIDTH_6_SCALE  + 50/WIDTH_6_SCALE))
        }
        if indexPath.section == 2{
            return CGSize(width: CGFloat((SCREEN_WIDTH - 11/WIDTH_6_SCALE - 32/WIDTH_6_SCALE)/2 - 1), height: CGFloat(198/WIDTH_6_SCALE))
        }
        return  CGSize(width: 0, height: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if (section == 2) {
            return UIEdgeInsets(top: 0, left: 13/WIDTH_6_SCALE, bottom: 0, right: 13/WIDTH_6_SCALE)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if (section == 2) {
            return 11/WIDTH_6_SCALE
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if (section == 2) {
            return 10/WIDTH_6_SCALE
        }
        return 0
    }
}
//网络
extension HomeViewController{
    func loadNetworkData(){
        homeSwiperVM.swiperPicData {//轮播图
            self.collectionView.reloadData()
        }
        homeSwiperVM.newsData { (newsContent, newsID) in//新闻
            self.newsIDArr =  newsID
            self.newsContentArr = newsContent
            self.collectionView.reloadData()
        }
        homeSwiperVM.classTypeData { (classTypeArr) in
            self.classTypeArr = classTypeArr
            self.collectionView.reloadData()
        }
    }
    
}
