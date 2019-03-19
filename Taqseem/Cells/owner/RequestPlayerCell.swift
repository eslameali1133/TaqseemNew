//
//  RequestPlayerCell.swift
//  Taqseem
//
//  Created by Husseinomda16 on 3/19/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class RequestPlayerCell: UITableViewCell {

    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var imgPlayer: customImageView!{
        didSet{
            imgPlayer.layer.cornerRadius =  imgPlayer.frame.width / 2
            imgPlayer.layer.borderWidth = 1
            //            ProfileImageView.layer.borderColor =  UIColor(red: 0, green: 156, blue: 158, alpha: 1) as! CGColor
            
            imgPlayer.clipsToBounds = true
            
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
