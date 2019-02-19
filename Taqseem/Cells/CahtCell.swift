//
//  CahtCell.swift
//  Taqseem
//
//  Created by apple on 2/17/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class CahtCell: UITableViewCell {

    
    @IBOutlet weak var lbl_chatCounter: UILabel!{
        didSet{
            lbl_chatCounter.layer.cornerRadius = lbl_chatCounter.frame.width / 2
            lbl_chatCounter.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
