//
//  LearnViewController.swift
//  单词app
//
//  Created by 金乃德 on 2018/4/2.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {

    var plan: Plan!
    var currentWord: Word!
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var phonetic: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var explanation: UILabel!
    @IBOutlet weak var learningView: UIView!
    @IBAction func recognize(_ sender: UIButton) {
        if plan.today.count - 1 > 0 {
            plan.today.remove(at: 0)
            currentWord = plan.today[0]
            let haveDone = defaults.integer(forKey: "haveDone")
            defaults.set(haveDone + 1, forKey: "haveDone")
            plan.haveDone += 1
            setLabel()
        } else {
            plan.today = []
            self.phonetic.text = ""
            self.name.text = ""
            learningView.isHidden = true
            self.explanation.text = "你已经完成今天的任务"
            self.nextButton.isEnabled = false
        }
        (navigationController?.viewControllers[0] as? MainViewController)?.updataLabelText()
    }
    @IBAction func confuse(_ sender: UIButton) {
        learningView.isHidden = true
        plan.today.append(currentWord)
        plan.today.remove(at: 0)
        currentWord = plan.today[0]
    }
    @IBAction func next(_ sender: UIButton) {
        learningView.isHidden = false
        setLabel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        currentWord = plan.today[0]
        setLabel()
    }
    
    func setLabel() {
        self.phonetic.text = currentWord.phonetic
        self.name.text = currentWord.name
        self.explanation.text = currentWord.explanation
    }
}
