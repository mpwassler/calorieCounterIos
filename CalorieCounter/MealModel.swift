//
//  MealModel.swift
//  CalorieCounter
//
//  Created by Mitchel on 3/27/16.
//  Copyright © 2016 Mitchel. All rights reserved.
//

import Foundation

class MealModel {
     var calorieCount: Int?
     var carbCount: Int?
     var date: Date?
     var fatCount: Int?
     var foodGroup: String?
     var name: String?
     var protienCount: Int?
    
    init( name: String , date: Date, cals: String?, protien: String?, fat: String?, carbs: String?, group: String? = "Not Specified") {
        
        self.calorieCount = Int(cals!) ?? 0
        self.carbCount = Int(carbs!) ?? 0
        self.date = date
        self.fatCount = Int(fat!) ?? 0
        self.foodGroup = group ?? "Not Specified"
        self.name = name
        self.protienCount = Int(protien!) ?? 0
    }
    
 
}
