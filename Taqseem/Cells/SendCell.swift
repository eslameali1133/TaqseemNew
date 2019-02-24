//
//  SendCell.swift
//  Taqseem
//
//  Created by apple on 2/24/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class SendCell: UITableViewCell {

    @IBOutlet weak var ContentViewMess: UIView!{
        didSet{
            ContentViewMess.dropShadow()
            ContentViewMess.layer.cornerRadius = 7
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
