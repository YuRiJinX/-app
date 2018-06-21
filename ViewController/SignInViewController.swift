//
//  SignInViewController.swift
//  单词app
//
//  Created by 金乃德 on 2018/4/23.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit
import LeanCloud

class SignInViewController: UIViewController {

    
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func SignIn(_ sender: UIButton) {
        if (userId.text != "") && (password.text != "") {
            LCUser.logIn(username: userId.text!, password: password.text!) { result in
                switch result {
                case .success( _):
                    self.performSegue(withIdentifier: "Sign In", sender: nil)
                    break
                case .failure(let error):
                    print(error)
                    let defaultAction = UIAlertAction(title: "好的", style: .default) { _ in
                        self.userId.text = nil;
                        self.password.text = nil;
                    }
                    let alert = UIAlertController(title: error.reason,
                                                  message: nil,
                                                  preferredStyle: .alert)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } else {
            let defaultAction = UIAlertAction(title: "好的", style: .default) { _ in
                self.userId.text = nil;
                self.password.text = nil;
            }
            let alert = UIAlertController(title: "请输入用户名和密码！",
                                          message: nil,
                                          preferredStyle: .alert)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true;
    }
    
    // MARK: - Navigation
}
