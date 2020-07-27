//
//  IroIroRGB.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 7/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hexCodeEightDigits:Int, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((hexCodeEightDigits & 0xFF0000) >> 16)/255,
            green: CGFloat((hexCodeEightDigits & 0x00FF00) >> 8)/255,
            blue:  CGFloat((hexCodeEightDigits & 0x0000FF) >> 0)/255, alpha: alpha
        ) // for instance: 0xfe5960
    }
}

extension UIViewController {
    
    func generateColorWithRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: Float) -> UIColor {
        
        let colorByRGB = UIColor.init(red: red/255, green: CGFloat(green/255), blue: (blue/255), alpha: CGFloat(alpha))

        return colorByRGB
    }
}



      

