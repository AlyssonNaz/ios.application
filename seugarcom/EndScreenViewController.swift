//
//  EndScreenViewController.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 12/03/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import UIKit

class EndScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func OnEndButtonClick(_ sender: UIButton) {
        self.parent?.performSegue(withIdentifier: "segueToMainMenuAfterFirstView", sender: self)
    }
}
