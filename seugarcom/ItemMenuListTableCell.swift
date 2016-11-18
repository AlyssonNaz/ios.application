//
//  ItemMenuList.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 24/04/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import UIKit

class ItemMenuListTableCell : UITableViewCell {
    
    
    @IBOutlet weak var imgMenuItem: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgMenuItem.backgroundColor = UIColor.clear
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
