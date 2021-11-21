//
//  Patient+CoreDataProperties.swift
//  dawaay
//
//  Created by Osama folta on 16/04/1443 AH.
//
//

import Foundation
import CoreData


extension Patient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Patient> {
        return NSFetchRequest<Patient>(entityName: "Patient")
    }

    @NSManaged public var patientLocation: Int64
    @NSManaged public var medcineName: String?
    @NSManaged public var password: String?
    @NSManaged public var phoneNumber: Int64
    @NSManaged public var qunatity: Int64
    @NSManaged public var userName: String?
    @NSManaged public var requset: NSSet?

}

// MARK: Generated accessors for requset
extension Patient {

    @objc(addRequsetObject:)
    @NSManaged public func addToRequset(_ value: Order)

    @objc(removeRequsetObject:)
    @NSManaged public func removeFromRequset(_ value: Order)

    @objc(addRequset:)
    @NSManaged public func addToRequset(_ values: NSSet)

    @objc(removeRequset:)
    @NSManaged public func removeFromRequset(_ values: NSSet)

}

extension Patient : Identifiable {

}
