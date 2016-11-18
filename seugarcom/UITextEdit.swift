//
//  UITextEdit.swift
//  2bar
//
//  Created by Alysson Nazareth on 12/11/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import UIKit

@IBDesignable
class UITextEdit: UITextField {
    var padding = UIEdgeInsets();
    
    @IBInspectable var Icon: UIImage? {
        didSet {
            setIcon();
        }
    }
    
//    @IBInspectable var NextTextEdit: UITextEdit? {
//        didSet {
////            setIcon();
//        }
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        setFont();
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func setIcon() {
        
        padding = UIEdgeInsets(top: 0, left: (Icon == nil) ? 10 : 40, bottom: 0, right: 5);
        
        if (Icon == nil){
            return;
        }
        
        self.leftViewMode = UITextFieldViewMode.always;
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: self.frame.height - 10));
        imageView.contentMode = UIViewContentMode.scaleAspectFit;
        let image = Icon;
        imageView.image = image;
        
        self.leftView = imageView;
    }
    
    func setFont() {
        self.font = UIFont(name: "Ubuntu-Light", size: 17);
    }
}



























