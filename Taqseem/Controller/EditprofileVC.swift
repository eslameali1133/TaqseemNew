//
//  EditprofileVC.swift
//  Taqseem
//
//  Created by apple on 2/17/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class EditprofileVC: UIViewController {

    @IBOutlet weak var ProfileImgeView: AMCircleImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
      ProfileImgeView.dropShadow()
       
    }
    

    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
