//
//  MainViewController.swift
//  woleyi-SwiftVersion
//
//  Created by ENERGY on 2019/9/21.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVc = HomeViewController.init()
        let liveVc = LiveViewController.init()
        let artVc = ArtViewController.init()
        let nearVc = NearViewController.init()
        let mineVc = MineViewController.init()
        self.setUpControllers(controller: homeVc, title: "首页", selectImg: "selectHome", unSelectImg: "unselectHome")
        self.setUpControllers(controller: liveVc, title: "直播", selectImg: "selectLive", unSelectImg: "unselectLive")
        self.setUpControllers(controller: artVc, title: "艺学堂", selectImg: "selectArtSchool", unSelectImg: "unselectArtSchool")
        self.setUpControllers(controller: nearVc, title: "附近", selectImg: "selectNear", unSelectImg: "unselectNear")
        self.setUpControllers(controller: mineVc, title: "我的", selectImg: "selectMine", unSelectImg: "unselectMine")
    }
}

extension MainViewController{
    func setUpControllers(controller:UIViewController, title:String, selectImg:String, unSelectImg:String) {
        controller.title = title
        controller.tabBarItem.selectedImage = UIImage.init(named: selectImg)
        controller.tabBarItem.image = UIImage.init(named: unSelectImg)
        let nav = UINavigationController.init(rootViewController: controller)
        addChild(nav)
    }
}
