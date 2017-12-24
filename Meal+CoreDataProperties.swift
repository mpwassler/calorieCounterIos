//
//  Meal+CoreDataProperties.swift
//  CalorieCounter
//
//  Created by Mitchel on 3/27/16.
//  Copyright © 2016 Mitchel. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Meal {

    @NSManaged var calorieCount: NSNumber?
    @NSManaged var carbCount: NSNumber?
    @NSManaged var date: Date?
    @NSManaged var fatCount: NSNumber?
    @NSManaged var foodGroup: String?
    @NSManaged var name: String?
    @NSManaged var protienCount: NSNumber?

}
