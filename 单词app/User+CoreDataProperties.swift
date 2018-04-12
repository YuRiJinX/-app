//
//  User+CoreDataProperties.swift
//  单词app
//
//  Created by 金乃德 on 2018/3/30.
//  Copyright © 2018年 金乃德. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int16
    @NSManaged public var isAdmin: Bool
    @NSManaged public var name: String?
    @NSManaged public var password: String?

}
