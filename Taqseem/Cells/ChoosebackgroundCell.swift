//
//  ChoosebackgroundCell.swift
//  Taqseem
//
//  Created by apple on 2/24/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class ChoosebackgroundCell: UITableViewCell {
  @IBOutlet weak var viewcontent: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewcontent.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
