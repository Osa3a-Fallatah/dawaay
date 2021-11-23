//
//  Order+CoreDataProperties.swift
//  dawaay
//
//  Created by Osama folta on 16/04/1443 AH.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var orderId: Int64
    @NSManaged public var orderDate: String?
    @NSManaged public var sataus: Bool
    @NSManaged public var order: Patient?
    @NSManaged public var requset: Pharmacy?

}

extension Order : Identifiable {

}
