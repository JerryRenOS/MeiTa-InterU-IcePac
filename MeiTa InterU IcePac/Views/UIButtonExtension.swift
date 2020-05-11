//
//  UIButtonExtension.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 5/11/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

@IBDesignable class CurvedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
}
