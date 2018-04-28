//
//  Expense+CoreDataProperties.swift
//  Expenses
//
//  Created by Adam Thoma-Perry on 4/27/18.
//  Copyright © 2018 Thoma-Perry, Adam. All rights reserved.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?

}
