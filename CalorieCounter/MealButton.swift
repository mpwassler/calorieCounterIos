//
//  MealButton.swift
//  CalorieCounter
//
//  Created by Mitchel on 4/11/16.
//  Copyright © 2016 Mitchel. All rights reserved.
//

import UIKit

class MealButton: UIButton {

    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = Theme.Colors.lightGreenColor.color.cgColor
        self.titleLabel!.font = Theme.Fonts.bodyFont.font
        self.titleLabel!.textColor = Theme.Colors.lightGreenColor.color
        self.setTitleColor(Theme.Colors.lightGreenColor.color, for: UIControlState())
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
