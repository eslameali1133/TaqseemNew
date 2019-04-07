//
//  PlaygroundHomeCell.swift
//  Taqseem
//
//  Created by apple on 3/4/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class PlaygroundHomeCell: UITableViewCell {
    var Ground_ID = ""
    @IBOutlet weak var contentview: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var imgGround: customImageView!{
        didSet{
            
        }
    }
    @IBOutlet weak var lblPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
