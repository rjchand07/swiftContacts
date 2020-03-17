//
//  tCell.swift
//  Contacts
//
//  Created by Thallapalli Rajachandra on 11/03/20.
//  Copyright © 2020 Thallapalli Rajachandra. All rights reserved.
//

import UIKit

class tCell: UITableViewCell {

    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.logoLabel.layer.cornerRadius = self.logoLabel.frame.height/2.0
        self.logoLabel.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
