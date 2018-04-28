//
//  Expense+CoreDataClass.swift
//  Expenses
//
//  Created by Adam Thoma-Perry on 4/27/18.
//  Copyright © 2018 Thoma-Perry, Adam. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    
    convenience init?(title: String?, subtitle: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Expense.entity(), insertInto: context)
        
        self.title = title
        self.subtitle = subtitle
        
    }
}
