//
//  Profile+CoreDataClass.swift
//  KeyStorage
//
//  Created by Дмитрий on 31.08.2023.
//
//

import Foundation
import CoreData

@objc(Profile)
public class Profile: NSManagedObject {}

extension Profile {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
//        return NSFetchRequest<Profile>(entityName: "Profile")
//    }

    @NSManaged public var platform: String?
    @NSManaged public var login: String?
    @NSManaged public var password: String?

}

extension Profile: Identifiable {}
