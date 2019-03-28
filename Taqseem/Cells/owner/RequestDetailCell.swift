//
//  RequestDetailCell.swift
//  Taqseem
//
//  Created by Husseinomda16 on 3/6/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class RequestDetailCell: UITableViewCell {

    @IBOutlet weak var imgUser: customImageView!{
        didSet{
            imgUser.layer.cornerRadius =  imgUser.frame.width / 2
            imgUser.layer.borderWidth = 1
            //            ProfileImageView.layer.borderColor =  UIColor(red: 0, green: 156, blue: 158, alpha: 1) as! CGColor
            
            imgUser.clipsToBounds = true
            
        }
    }
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgGround: customImageView!{
        didSet{
            
        }
    }
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnStatus: UIButton!{
        didSet{
            btnStatus.layer.cornerRadius = 4
            btnStatus.clipsToBounds = true
            
        }
    }
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblGroundName: UILabel!
    @IBOutlet weak var cntntView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
