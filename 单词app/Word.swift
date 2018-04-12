//
//  Word.swift
//  单词app
//
//  Created by 金乃德 on 2018/3/29.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class WordManagedObject: NSManagedObject {
    
    @NSManaged var explanation: String?
    @NSManaged var name: String?
    @NSManaged var phonetic: String?

}
