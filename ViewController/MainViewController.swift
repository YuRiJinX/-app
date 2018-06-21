//
//  MainViewController.swift
//  单词app
//
//  Created by 金乃德 on 2018/4/2.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var today: UILabel!
    @IBOutlet weak var haveDone: UILabel!
    @IBOutlet weak var remain: UILabel!
    
    var plan: Plan?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plan = (self.tabBarController as? tabBarViewController)?.plan
        updataLabelText()
    }
    
    func updataLabelText() {
        if let havePlan = plan {
            today.text = String(havePlan.today.count)
            haveDone.text = String(havePlan.haveDone)
            remain.text = String(havePlan.remain)
        } else {
            today.text = String(0)
            haveDone.text = String(0)
            remain.text = String(0)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "learn" {
            if let havePlan = plan {
                if havePlan.today.count > 0 {
                    return true
                } else {
                    print(havePlan.remain)
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "learn":
                if let lvc = segue.destination as? LearnViewController {
                    lvc.plan = plan
                }
            default:
                break
            }
        }
    }
}
