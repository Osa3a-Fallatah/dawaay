//
//  Pharmacy+CoreDataProperties.swift
//  dawaay
//
//  Created by Osama folta on 16/04/1443 AH.
//
//

import Foundation
import CoreData


extension Pharmacy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pharmacy> {
        return NSFetchRequest<Pharmacy>(entityName: "Pharmacy")
    }

    @NSManaged public var drugsAvailable: String?
    @NSManaged public var drugsNames: String?
    @NSManaged public var usename: String?
    @NSManaged public var password: String?
    @NSManaged public var status: Bool
    @NSManaged public var requset: NSSet?

}

// MARK: Generated accessors for requset
extension Pharmacy {

    @objc(addRequsetObject:)
    @NSManaged public func addToRequset(_ value: Order)

    @objc(removeRequsetObject:)
    @NSManaged public func removeFromRequset(_ value: Order)

    @objc(addRequset:)
    @NSManaged public func addToRequset(_ values: NSSet)

    @objc(removeRequset:)
    @NSManaged public func removeFromRequset(_ values: NSSet)

}

extension Pharmacy : Identifiable {

}
