//
//  AccountVC.swift
//  Taqseem
//
//  Created by apple on 2/17/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var lblnumOfMatches: UILabel!
    @IBOutlet weak var MatchedPlayedView: UIView!
    
      @IBOutlet weak var PositionV: UIView!
      @IBOutlet weak var PhoneV: UIView!
    @IBOutlet weak var EmailV: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

         MatchedPlayedView.dropShadow()
//          MatchesDeffV.dropShadow()
        PositionV.dropShadow()
        PhoneV.dropShadow()
        EmailV.dropShadow()
        
            lblEmail.text = AppCommon.sharedInstance.getJSON("Profiledata")["email"].stringValue
            lblPhone.text = AppCommon.sharedInstance.getJSON("Profiledata")["phone"].stringValue
            lblPosition.text = AppCommon.sharedInstance.getJSON("Profiledata")["position"].stringValue
            lblnumOfMatches.text = AppCommon.sharedInstance.getJSON("Profiledata")["matches"].stringValue
        }

    }
    

    

