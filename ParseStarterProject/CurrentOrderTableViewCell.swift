//
//  CurrentOrderTableViewCell.swift
//  Money2020
//
//  Created by Suchit Panjiyar on 10/24/15.
//  Copyright © 2015 Hack. All rights reserved.
//

import UIKit

class CurrentOrderTableViewCell: UITableViewCell {
    
    var order = 0
    var namely = String()
    var ed = String()
    var quan = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        orderNumber.text = String(order)
        name.text = namely
        extraDetails.text = ed
        quantity.text = String(quan)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var orderNumber: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var extraDetails: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    
    
    
    
}
