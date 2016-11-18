//
//  MenuViewController.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 13/03/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import UIKit


class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!

    var menuItems: [MenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loremText = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat"
        
        menuItems = [
            MenuItem(title: "Fritas", description: loremText),
            MenuItem(title: "Torresmo", description: loremText),
            MenuItem(title: "Fritas com Bacon", description: loremText),
            MenuItem(title: "Skol Latão", description: loremText),
            MenuItem(title: "Coca-Cola", description: loremText),
            MenuItem(title: "Picanha", description: loremText),
            MenuItem(title: "Medalhão", description: loremText),
            MenuItem(title: "Vodka", description: loremText),
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemMenuListTableCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemMenuListTableCell

        cell.lbTitle.text = self.menuItems[(indexPath as NSIndexPath).row].Name
        cell.lbDescription.text = self.menuItems[(indexPath as NSIndexPath).row].Description
        print(cell.lbDescription?.text!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\((indexPath as NSIndexPath).row)!")
    }
}

class MenuItem {
    var Name : String?
    var Description : String?
    
    init(title: String, description: String) {
        self.Name = title
        self.Description = description
    }
}
