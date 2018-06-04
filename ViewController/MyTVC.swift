//
//  MyTVC.swift
//  单词app
//
//  Created by 金乃德 on 2018/5/31.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit
import LeanCloud
import CoreData

class MyTVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var wordListClass: String?
    var isDownloaded = false;
    
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var wordListName: UILabel!
    @IBOutlet weak var wordListImage: UIImageView!
    @IBAction func download(_ sender: UIButton) {
        let context = AppDelegate.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WordList")
        request.predicate = NSPredicate(format: "name == %@", "\(wordListName.text!)")
        do {
            let result = try context.fetch(request)
            if result.count > 0 {
                self.isDownloaded = (result[0] as! NSManagedObject).value(forKey: "isDownloaded") as! Bool
            }
        } catch {
            print("Failed")
        }
        
        if !isDownloaded {
            let wordEntity = NSEntityDescription.entity(forEntityName: "Word", in: context)
            let wordListEntity = NSEntityDescription.entity(forEntityName: "WordList", in: context)
            let wordQuery = LCQuery(className: wordListClass!)
            wordQuery.limit = 1000
            var words: [LCObject] = []
            wordQuery.whereKey("spell", .existed)
            wordQuery.find { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let objects):
                    words = objects
                    for word in words {
                        let newWord = NSManagedObject(entity: wordEntity!, insertInto: context)
                        newWord.setValue(word.get("spell")?.stringValue!, forKey: "name")
                        newWord.setValue(word.get("phonetic")?.stringValue!, forKey: "phonetic")
                        newWord.setValue(word.get("explanation")?.stringValue!, forKey: "explanation")
                        do {
                            try context.save()
                        } catch {
                            print("failed")
                        }
                    }
                    let newWordList = NSManagedObject(entity: wordListEntity!, insertInto: context)
                    newWordList.setValue(self.wordListName.text!, forKey: "name")
                    newWordList.setValue(true, forKey: "isDownloaded")
                    do {
                        try context.save()
                    } catch {
                        print("failed")
                    }
                    print("导入成功！")
                    sender.isEnabled = false
                }
            }
        } else {
            sender.isEnabled = false
            print("词库已下载")
        }
        
        
    }
    
    
}
