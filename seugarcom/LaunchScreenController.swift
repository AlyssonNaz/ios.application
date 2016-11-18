//
//  LaunchScreenController.swift
//  2bar
//
//  Created by Alysson Nazareth on 19/10/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import UIKit

class LaunchScreenController: BaseUIViewController {
    // MARK: Initialize
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Thread.sleep(forTimeInterval: 5)
        self.performSegue(withIdentifier: "segueToLogin", sender: self)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
