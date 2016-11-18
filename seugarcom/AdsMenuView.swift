//
//  AdsMenuView.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 14/03/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import UIKit

@IBDesignable class AdsMenuView: UIView {
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let backgroundImage = UIImageView(frame: self.bounds);
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill;
        backgroundImage.image = UIImage(named: "BackgroundLogin")
        backgroundImage.frame.size.height = 50
        self.insertSubview(backgroundImage, at: 0)
        
    }
}
