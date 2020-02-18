//
//  UIColor + Extension.swift
//  WebViewiOSDemo
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func White() -> UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    class func textFieldColor () -> UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    class func textFieldBorderColor () -> UIColor {
        return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    class func bgMaterialSheet () -> UIColor {
        return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.25)
    }
    
    class func borderCTAColor() -> UIColor {
        return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    class func messageValidationTrueColor() -> UIColor {
        return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    
    class func messageValidationFalseColor() -> UIColor {
        return #colorLiteral(red: 0.862745098, green: 0.07843137255, blue: 0.2352941176, alpha: 1)
    }
}
