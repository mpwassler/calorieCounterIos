//
//  MealListModel.swift
//  CalorieCounter
//
//  Created by Mitchel on 3/27/16.
//  Copyright © 2016 Mitchel. All rights reserved.
//

import Foundation

class MealListModel {

    var meals = [MealModel]()
    
     static let sharedInstance = MealListModel()
    
    init( ) {}
    
    func addMeal(_ meal: MealModel) {
        meals += [meal]
        print(meals)
    }
    
    func getTotalCalories() -> Int {
        return self.getData { $0.calorieCount! }
    }
    
    func getTotalFat() -> String {
        return "Fat \n \(self.getData { $0.fatCount! })g"
    }
    
    func getTotalProtien() -> String {
        return "Protien \n \(self.getData { $0.protienCount! })g"
    }
    
    func getTotalCarbs() -> String {
        return "Carbs \n \(self.getData { $0.carbCount! })g"
    }
    
    func getData( _ query : ( _ meal : MealModel ) -> Int ) -> Int {
        let models = meals.map(query)
        let total = models.reduce(0) { $0 + $1 }
        return total
    }
}
