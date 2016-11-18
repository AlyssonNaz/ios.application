//
//  RoulettMenu.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 23/04/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import UIKit

@IBDesignable class RoulettMenuView : UIView
{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.green.setFill()
        path.fill()
    }
}

