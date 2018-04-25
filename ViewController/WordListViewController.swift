//
//  WordListViewController.swift
//  单词app
//
//  Created by 金乃德 on 2018/4/19.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit
import CoreData

class WordListViewController: UIViewController {

    var context: NSManagedObjectContext!
    var appDelegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
