//
//  CurrentOrderTableViewCell.swift
//  Money2020
//
//  Created by Suchit Panjiyar on 10/24/15.
//  Copyright © 2015 Hack. All rights reserved.
//

import UIKit

class CurrentOrderTableViewCell: UITableViewCell {
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var orderNumber: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    
    
    
    
}
