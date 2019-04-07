//
//  playGroundDetailsSegVC.swift
//  Taqseem
//
//  Created by apple on 2/24/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class playGroundDetailsSegVC: UIViewController {
      
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var Constain_IconImge_Height: NSLayoutConstraint!
    @IBOutlet weak var Constain_IconImge_Widhtt: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        FillData()
        // Do any additional setup after loading the view.
    }
    func FillData(){
//        print(Gitem._address)
        if comedromneartoplay == "NearME"{
            lblTime.text = GNearItems._time
            lblCapacity.text = "\(GNearItems._capacity) Players"
            lblDuration.text = "\(GNearItems._duration) Hours"
            lblDate.text = GNearItems._date
            lblSalary.text = "\(GNearItems._price) SAR/H"
            lblAddress.text = GNearItems._address
        }else if comedromneartoplay == "Fav"{
            lblTime.text = GFav._time
            lblCapacity.text = "\(GFav._capacity) Players"
            lblDuration.text = "\(GFav._duration) Hours"
            lblDate.text = GFav._date
            lblSalary.text = "\(GFav._price) SAR/H"
            lblAddress.text = GFav._address
        }else{
        lblTime.text = GMatchDetails._Time
            lblCapacity.text = "\(GMatchDetails._Capacity) Players"
            lblDuration.text = "\(GMatchDetails._Duration) Hours"
            lblDate.text = GMatchDetails._Date
            lblSalary.text = "\(Gitem._price) SAR/H"
        lblAddress.text = Gitem._address
        }
        
    }
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func setupConstrin(){
//        Constain_IconImge_Height.constant = view.frame.width / 16
//        Constain_IconImge_Widhtt.constant = view.frame.width / 16
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
