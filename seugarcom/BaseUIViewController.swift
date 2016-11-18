//
//  BaseViewController.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 26/03/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import UIKit



class BaseUIViewController : UIViewController, ProtocolDelegate {
    var ActivityIndicator : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.InitializeActivityIndicator()

    }
    
    fileprivate func InitializeActivityIndicator(){
        ActivityIndicator = UIActivityIndicatorView()
        ActivityIndicator.frame = CGRect(x: 0, y: 0, width: self.view.frame.width/5, height: self.view.frame.width/5)
        ActivityIndicator.activityIndicatorViewStyle = .whiteLarge
        ActivityIndicator.center = self.view.center
        ActivityIndicator.hidesWhenStopped = true
        self.view.addSubview(ActivityIndicator)
    }
    
    func OnBeforeSendMessage() {
        ActivityIndicator.startAnimating()
    }
    
    func OnFinishSendMessage() {
        ActivityIndicator.stopAnimating()
    }
}
