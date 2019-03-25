//
//  MyMatchVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/20/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit
import SwiftyJSON
class MyMatchVC: UIViewController {
 var comeFrom = ""
    var item : PlaygroundModelClass!
    var match : MatchsModelClass!
    
    @IBOutlet weak var lblGroundName: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgUser: customImageView!{
        didSet{
            imgUser.layer.cornerRadius =  imgUser.frame.width / 2
            imgUser.layer.borderWidth = 1
            //            ProfileImageView.layer.borderColor =  UIColor(red: 0, green: 156, blue: 158, alpha: 1) as! CGColor
            
            imgUser.clipsToBounds = true
            
        }
    }
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var btn_join: UIButton!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var Constain_IconImge_Height: NSLayoutConstraint!
        @IBOutlet weak var Constain_IconImge_Widhtt: NSLayoutConstraint!
    
    @IBOutlet weak var Constain_profileImge_Height: NSLayoutConstraint!
    @IBOutlet weak var Constain_profileImge_Widhtt: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // print(item._address)
        //setupConstrin()
        lbl_title.text = title
        btn_join.isHidden = true
        if comedromneartoplay == true
        {
           comedromneartoplay = false
              btn_join.isHidden = false
            lbl_title.text = "NEAR ME"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPlayer(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Owner", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "OwnerRequestPlayersVC")as! OwnerRequestPlayersVC
        cont.ReservationNum = match._reservation_no
        self.present(cont, animated: true, completion: nil)

    }
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func setupConstrin(){
        Constain_IconImge_Height.constant = view.frame.width / 16
        Constain_IconImge_Widhtt.constant = view.frame.width / 16
        
        Constain_profileImge_Height.constant = view.frame.width / 5.6
        Constain_profileImge_Widhtt.constant = view.frame.width / 5.6
    }
    override func viewWillAppear(_ animated: Bool) {
        fillData()
    }
    
    func fillData() {
    
        lblTime.text = "\(match._time)"
        lblGroundName.text = match._ground_name
        lblDate.text = match._date
        lblSalary.text = "\(match._price) SAR"
        lblAddress.text = match._address
        lblCapacity.text = "\(match._capacity) Players"
        lblDuration.text = "\(match._duration) Hours"
        lblUserName.text = match._user_name
        if match._photo != ""
        {
        imgUser.loadimageUsingUrlString(url: match._photo)
        }
    }
   

}
