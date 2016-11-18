//
//  UINavView.swift
//  2bar
//
//  Created by Alysson Nazareth on 21/10/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import UIKit


@IBDesignable class UINavView: UIView {

    var view:UIView!
    
    @IBOutlet weak var labelTeste: UILabel!
    
    @IBInspectable
    var mytitleLabelText: String? {
        get {
            return labelTeste.text
        }
        set(mytitleLabelText) {
            labelTeste.text = mytitleLabelText
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
//        self.addSubview(view)
        
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)

        layer.colors = [UIColor(string: "E9212D").cgColor, UIColor(string: "B22229").cgColor]
        self.layer.addSublayer(layer)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for:type(of: self))
        let nib = UINib(nibName: "UINavView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
