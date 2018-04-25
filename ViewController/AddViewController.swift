//
//  AddViewController.swift
//  单词app
//
//  Created by 金乃德 on 2018/4/2.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    var appDelegate: AppDelegate!
    
    
    @IBAction func display(_ sender: UIButton) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Word")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "name") as! String)
            }
        } catch {
            print("Failed")
        }
    }
    
    @IBOutlet weak var spell: UITextField!
    @IBOutlet weak var phonetic: UITextField!
    @IBOutlet weak var explanation: UITextField!
    @IBAction func save(_ sender: UIButton) {
        let entity = NSEntityDescription.entity(forEntityName: "Word", in: context)
        let newWord = NSManagedObject(entity: entity!, insertInto: context)
        
        if (spell.text != "") && (phonetic.text != "") && (explanation.text != "") {
            print(spell.text!);
            print(phonetic.text!);
            print(explanation.text!);
            
            newWord.setValue(spell.text!, forKey: "name")
            newWord.setValue(phonetic.text!, forKey: "phonetic")
            newWord.setValue(explanation.text!, forKey: "explanation")
            
            spell.text = ""
            phonetic.text = ""
            explanation.text = ""
            
            print(context.hasChanges)
            
            do {
                try context.save()
            } catch {
                print("failed")
            }

            let alert = UIAlertController(title: "保存完毕", message: "已添加一条新纪录", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("好的", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            
            let alert = UIAlertController(title: "警告！", message: "请填写所有内容", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("好的", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
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
