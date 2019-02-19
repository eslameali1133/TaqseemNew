//
//  AccountVC.swift
//  Taqseem
//
//  Created by apple on 2/17/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var MatchedPlayedView: UIView!
     @IBOutlet weak var MatchesDeffV: UIView!
    
      @IBOutlet weak var PositionV: UIView!
      @IBOutlet weak var PhoneV: UIView!
    @IBOutlet weak var EmailV: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

         MatchedPlayedView.dropShadow()
          MatchesDeffV.dropShadow()
        PositionV.dropShadow()
        PhoneV.dropShadow()
        EmailV.dropShadow()
        

    }
    

    

}
