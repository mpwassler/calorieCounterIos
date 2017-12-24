//
//  AddMealFormTableViewController.swift
//  CalorieCounter
//
//  Created by Mitchel on 3/21/16.
//  Copyright © 2016 Mitchel. All rights reserved.
//

import UIKit

import SwiftValidator

class AddMealFormTableViewController: UITableViewController, UITextFieldDelegate, ValidationDelegate {
    
    @IBOutlet weak var nameFeild: UITextField!
    @IBOutlet weak var caloriesField: UITextField!
    @IBOutlet weak var protienField: UITextField!
    @IBOutlet weak var fatField: UITextField!
    @IBOutlet weak var carbField: UITextField!
   

   let titleHeaders = ["Meal Info", "Nutrition Data", "Food Group"]
    
   let validator = Validator()
    
    var onDataAvailable : ((_ data: MealModel) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        nameFeild.delegate = self
        caloriesField.delegate = self
        caloriesField.keyboardType = .numberPad
        protienField.delegate = self
        protienField.keyboardType = .numberPad
        fatField.delegate = self
        fatField.keyboardType = .numberPad
        carbField.delegate = self
        carbField.keyboardType = .numberPad
      
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddMealFormTableViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        tableView.tableFooterView = UIView()
        
        validator.registerField(nameFeild, rules: [ RequiredRule() ])
        validator.registerField(caloriesField, rules: [ RequiredRule(), FloatRule() ])
        validator.registerField(protienField, rules: [ FloatRule() ])
        validator.registerField(fatField, rules: [ FloatRule() ])
        validator.registerField(carbField, rules: [ FloatRule() ])
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 20, y: 40, width: 190, height: 20) )
        let headerLabel = UILabel()
        headerView.backgroundColor = Theme.Colors.lightGreenColor.color
        headerLabel.frame = CGRect(x: 20, y: 10, width: 190, height: 20)
        headerLabel.text = titleHeaders[section]
        headerLabel.textColor = UIColor.white
        headerView.addSubview(headerLabel)
        headerLabel.font = Theme.Fonts.subTextFont.font
        return headerView
    }
    
    @IBAction func saveMeal(_ sender: UIBarButtonItem) {
        validator.validate(self)
    }
    
    @IBAction func dismissForm(_ sender: UIBarButtonItem) {

        self.dismiss(animated: true, completion: {});
    }
    
    func sendData(_ data: MealModel) {
        // Whenever you want to send data back to viewController1, check
        // if the closure is implemented and then call it if it is
        self.onDataAvailable?(data)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validationSuccessful() {
        
        let newMeal = MealModel(
            name: nameFeild.text!,
            date: Date(),
            cals: caloriesField.text,
            protien: protienField.text,
            fat: fatField.text,
            carbs: carbField.text
        )
        sendData( newMeal )        
        self.dismiss(animated: true, completion: {})
    }
    
    func validationFailed(_ errors:[UITextField:ValidationError]) {
        // turn the fields to red
        for (field, _) in validator.errors {
            field.layer.borderColor = UIColor.red.cgColor
            field.layer.borderWidth = 2.0
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
        return true
    }

}
