//
//  AccountVC.swift
//  Taqseem
//
//  Created by apple on 2/17/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var ProfileImageView: customImageView!{
        didSet{
            ProfileImageView.layer.cornerRadius =  ProfileImageView.frame.width / 2
            ProfileImageView.layer.borderWidth = 1
//            ProfileImageView.layer.borderColor =  UIColor(red: 0, green: 156, blue: 158, alpha: 1) as! CGColor
            
            ProfileImageView.clipsToBounds = true
            
        }
    }
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var lblnumOfMatches: UILabel!
    @IBOutlet weak var MatchedPlayedView: UIView!
    
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var PositionV: UIView!
      @IBOutlet weak var PhoneV: UIView!
    @IBOutlet weak var EmailV: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadInputViews()
         MatchedPlayedView.dropShadow()
//          MatchesDeffV.dropShadow()
        PositionV.dropShadow()
        PhoneV.dropShadow()
        EmailV.dropShadow()
        
    
        }
    override func viewWillAppear(_ animated: Bool) {
        SetData()
    }
    
    func  SetData(){
        lbl_name.text = AppCommon.sharedInstance.getJSON("Profiledata")["name"].stringValue
        lblEmail.text = AppCommon.sharedInstance.getJSON("Profiledata")["email"].stringValue
        lblPhone.text = AppCommon.sharedInstance.getJSON("Profiledata")["phone"].stringValue
        lblPosition.text = AppCommon.sharedInstance.getJSON("Profiledata")["position"].stringValue
        lblnumOfMatches.text = AppCommon.sharedInstance.getJSON("Profiledata")["matches"].stringValue
       print(AppCommon.sharedInstance.getJSON("Profiledata")["photo"].stringValue)
        ProfileImageView.loadimageUsingUrlString(url:"\(APIConstants.Base_Image_URL)\(AppCommon.sharedInstance.getJSON("Profiledata")["photo"].stringValue)")
        
    }
    
    

    }
    

    

