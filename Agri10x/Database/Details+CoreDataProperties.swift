//
//  Details+CoreDataProperties.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//
//

import Foundation
import CoreData


extension Details {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Details> {
        return NSFetchRequest<Details>(entityName: "Details")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var price: Double
    @NSManaged public var desc: String?
    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var rate: Double
    @NSManaged public var count: Int32

}

extension Details : Identifiable {

}
