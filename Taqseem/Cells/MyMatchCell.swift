//
//  MyMatchCell.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/20/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class MyMatchCell: UITableViewCell {

    
    
    @IBOutlet weak var lbl_nq: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dropShadow()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
