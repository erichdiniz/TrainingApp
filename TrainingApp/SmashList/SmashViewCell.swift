//
//  SmashViewCell.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 09/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit

class SmashViewCell: UITableViewCell {

    //the cells that will be having inside each row
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tier: UILabel!
    @IBOutlet weak var fallspeed: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false )

        // Configure the view for the selected state
    }
    
}
