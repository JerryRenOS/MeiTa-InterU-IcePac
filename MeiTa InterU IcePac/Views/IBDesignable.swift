//
//  IBDesignable.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 7/10/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

@IBDesignable class RButton: UIButton {
    @IBInspectable var cRadius: CGFloat = 3.00 {
        didSet {
            self.layer.cornerRadius = cRadius
        }
    }
}
