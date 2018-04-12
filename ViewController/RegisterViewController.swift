//
//  RegisterViewController.swift
//  单词app
//
//  Created by 金乃德 on 2018/3/29.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    var dc: DataController!;
    var pc: NSPersistentContainer!;
    var viewContext: NSManagedObjectContext!;
    
    func addANewUser(name: String ,password: String){
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: viewContext)
        newUser.setValue(name, forKey: "name")
        newUser.setValue(password, forKey: "password")
        newUser.setValue(true, forKey: "isAdmin")
    }
    
    func applicationDirectoryPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String
    }
    
    @IBOutlet weak var pickView: UIPickerView!
    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        addANewUser(name: idText.text!, password: passwordText.text!)
        dc.saveContext();
        let path = applicationDirectoryPath();
        print(path)
        print("save done!")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dc = appDelegate.dataController
        pc = dc?.persistentContainer;
        viewContext = dc?.getViewContext();
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
