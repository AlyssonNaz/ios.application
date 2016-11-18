//
//  UIButtonEdit.swift
//  2bar
//
//  Created by Alysson Nazareth on 13/11/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import UIKit

@IBDesignable
class UIButtonEdit: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = (layer.frame.height/2) + 4
    }
}
