//
//  Friend+CoreDataProperties.swift
//  
//
//  Created by Чингиз on 19.07.2018.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String?
    @NSManaged public var profileimagename: String?
    @NSManaged public var lastMessage: Message?
    @NSManaged public var message: NSSet?

}

// MARK: Generated accessors for message
extension Friend {

    @objc(addMessageObject:)
    @NSManaged public func addToMessage(_ value: Message)

    @objc(removeMessageObject:)
    @NSManaged public func removeFromMessage(_ value: Message)

    @objc(addMessage:)
    @NSManaged public func addToMessage(_ values: NSSet)

    @objc(removeMessage:)
    @NSManaged public func removeFromMessage(_ values: NSSet)

}
