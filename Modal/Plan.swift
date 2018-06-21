//
//  Plan.swift
//  单词app
//
//  Created by 金乃德 on 2018/5/29.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import Foundation
import CoreData

class Plan {
    let context = AppDelegate.viewContext
    let defaults = UserDefaults.standard
    
    var today: [Word]
    var haveDone: Int
    var wordsNumberOfEveryList: Int
    
    var Words: [Word]
    
    
    var remain: Int {
        return Words.count - haveDone
    }
    
    init() {
        wordsNumberOfEveryList = defaults.integer(forKey: "numberOfWords")
        haveDone = defaults.integer(forKey: "haveDone")
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Word")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            self.Words = result as! [Word]
            print("导入成功\(result.count)")
        } catch {
            self.Words = []
        }
        today = []
    }
    
    func createPlan() {
        if remain > wordsNumberOfEveryList {
            today = Array(Words[haveDone...haveDone + wordsNumberOfEveryList - 1])
        } else if remain > 0 {
            today = Array(Words[haveDone...Words.count - 1])
        } else {
            today = []
        }
    }
}
