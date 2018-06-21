//
//  tabBarControllerViewController.swift
//  单词app
//
//  Created by 金乃德 on 2018/5/19.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit
import LeanCloud

class tabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    let wordListQuery = LCQuery(className: "Wordlist")
    var rawValues: [LCObject] = []
    var plan = Plan()

    override func viewDidLoad() {
        
        let vc = self.viewControllers!
        vc[0].tabBarItem.image = UIImage(named: "home")
        vc[1].tabBarItem.image = UIImage(named: "STATISTICS")
        vc[2].tabBarItem.image = UIImage(named: "book")
        vc[3].tabBarItem.image = UIImage(named: "people")
        delegate = self
        plan.createPlan()
        wordListQuery.whereKey("WordListName", .existed)
        wordListQuery.find { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let objects):
                self.rawValues = objects
            }
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let wlvc = viewController as? WordListController {
            wlvc.wordlist = rawValues
        }
    }
}
