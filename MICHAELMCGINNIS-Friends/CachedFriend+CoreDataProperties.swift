//
//  CachedFriend+CoreDataProperties.swift
//  MICHAELMCGINNIS-Friends
//
//  Created by Michael Mcginnis on 4/6/22.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var userFriend: Set<CachedUser>?


}

extension CachedFriend : Identifiable {

}
