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
    
    var plan = Plan()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plan.createPlan()
        today.text = String(plan.today.count)
        haveDone.text = String(plan.haveDone)
        remain.text = String(plan.remain)
        
        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "learn" {
            if plan.today.count > 0 {
                return true
            } else {
                print(plan.remain)
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
