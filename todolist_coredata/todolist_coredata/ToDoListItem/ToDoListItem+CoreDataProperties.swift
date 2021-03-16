//
//  ToDoListItem+CoreDataProperties.swift
//  todolist_coredata
//
//  Created by 송영욱 on 2021/03/15.
//
//

import Foundation
import CoreData


extension ToDoListItem { //ToDoListItem의 확장

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?

}

extension ToDoListItem : Identifiable {

}
