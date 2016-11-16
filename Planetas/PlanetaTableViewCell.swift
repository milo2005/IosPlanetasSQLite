//
//  PlanetaTableViewCell.swift
//  Planetas
//
//  Created by Aplimovil on 11/4/16.
//  Copyright © 2016 Aplimovil. All rights reserved.
//

import UIKit

class PlanetaTableViewCell: UITableViewCell {

    @IBOutlet var nombre: UILabel!
    @IBOutlet var gravedad: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
