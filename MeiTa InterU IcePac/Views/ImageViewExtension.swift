//
//  ImageViewExtension.swift
//  MeiTa InterU IcePac
//
//  Created by Jerry Ren on 5/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CurvedImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}           
              
