//
//  SignUpViewController.swift
//  单词app
//
//  Created by 金乃德 on 2018/4/23.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit
import LeanCloud

class SignUpViewController: UIViewController {

    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordRepeat: UITextField!
    @IBAction func SignUp(_ sender: UIButton) {
        if (userId.text != "") && (password.text != "") && (passwordRepeat.text != ""){
            if (passwordRepeat.text! == password.text!) {
                let newUser = LCUser()
                
                newUser.username = LCString(userId.text!);
                newUser.password = LCString(password.text!);
                
                newUser.signUp()
                
                let defaultAction = UIAlertAction(title: "好的", style: .default) { _ in
                    self.dismiss(animated: true, completion: nil)
                }
                let alert = UIAlertController(title: "注册成功！",
                                              message: nil,
                                              preferredStyle: .alert)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            } else {
                let defaultAction = UIAlertAction(title: "好的", style: .default) { _ in
                    self.password.text = nil;
                    self.passwordRepeat.text = nil;
                }
                let alert = UIAlertController(title: "两次输入的密码不同",
                    message: "请确保您两次输入的密码是相同的!",
                    preferredStyle: .alert)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let defaultAction = UIAlertAction(title: "好的", style: .default) { _ in
            }
            let alert = UIAlertController(title: "请填写所有信息！",
                                          message: "请输入所有信息",
                                          preferredStyle: .alert)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true;
        passwordRepeat.isSecureTextEntry = true;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
