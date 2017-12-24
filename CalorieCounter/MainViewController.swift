//
//  ViewController.swift
//  CalorieCounter
//
//  Created by Mitchel on 3/19/16.
//  Copyright © 2016 Mitchel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainCalorieLabel: UILabel!
    @IBOutlet weak var calorieSubLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var protienLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    
    var meals = MealListModel.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setThemeSettings()
      

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainCalorieLabel.text =  "\(meals.getTotalCalories())"
        protienLabel.text = meals.getTotalProtien()
        carbLabel.text = meals.getTotalCarbs()
        fatLabel.text = meals.getTotalFat()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func processData(_ meal: MealModel) {
        
        meals.addMeal(meal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        let dataClosure : ((_ data: MealModel) -> ()) = {[weak self]
            (data) in
            if let weakSelf = self {
                weakSelf.processData(data)
            }
        }
        if let viewController = segue.destination as? AddMealFormTableViewController {
            viewController.onDataAvailable = dataClosure
        } else {
            let destinationNavigationController = segue.destination as? UINavigationController
            let targetController = destinationNavigationController!.topViewController as! AddMealFormTableViewController
            targetController.onDataAvailable = dataClosure
        }
    }
    
    func setThemeSettings() {
        mainCalorieLabel.textColor = UIColor.white
        mainCalorieLabel.font = Theme.Fonts.titleFont.font
        calorieSubLabel.textColor = UIColor.white
        calorieSubLabel.font = Theme.Fonts.subTitleFont.font
        calorieSubLabel.numberOfLines = 0
    }

}

