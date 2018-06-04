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

    override func viewDidLoad() {
        delegate = self
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
        } else if let mvc = viewController as? MainViewController {
            //
        }
    }
}
