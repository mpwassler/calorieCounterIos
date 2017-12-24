//
//  Theme.swift
//  CalorieCounter
//
//  Created by Mitchel on 3/19/16.
//  Copyright © 2016 Mitchel. All rights reserved.
//

import UIKit

struct Theme {
    
    enum Colors {

        case backgroundColor
        case darkGreenColor
        case lightGreenColor
        case greyColor
        
        var color: UIColor {
            switch self {
            
            case .backgroundColor: return UIColor(red:0.98, green:0.98, blue:0.97, alpha:1)
                
            case .darkGreenColor: return UIColor(red:0.51, green:0.68, blue:0.04, alpha:1)
                
            case .lightGreenColor: return UIColor(red:0.69, green:0.79, blue:0.16, alpha:1)
                
            case .greyColor: return UIColor(red:0.38, green:0.38, blue:0.38, alpha:1)

            }
        }
    }
    
    enum Fonts {
        case titleFont
        case subTitleFont
        case bodyFont
        case subTextFont
        case listFont
        
        var font: UIFont {
            switch self {
            case .titleFont: return UIFont(name: "Thonburi-Bold", size: 62)!
            case .subTitleFont: return UIFont(name: "Thonburi", size: 18)!
            case .bodyFont: return UIFont(name: "Thonburi", size: 12)!
            case .subTextFont: return UIFont(name: "Thonburi", size: 14)!
            case .listFont: return UIFont(name: "Thonburi", size: 14)!
            }
        }
    }
}
