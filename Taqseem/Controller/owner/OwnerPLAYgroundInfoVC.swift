//
//  OwnerPLAYgroundInfoVC.swift
//  Taqseem
//
//  Created by apple on 3/4/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class OwnerPLAYgroundInfoVC: UIViewController {
    var items = GlobalGroundDetails
    
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblTimes: UILabel!
    @IBOutlet weak var lblDayes: UILabel!
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var lblMatchPlayed: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblGroundName: UILabel!
    @IBOutlet weak var imgGround: customImageView!{
        didSet{
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        FillData()
    }
    
    
    @IBAction func btn_Edit(_ sender: Any) {
      
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Owner", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "AddPlayGroundVC")as! AddPlayGroundVC
isEidtplayground = true
        self.show(cont, sender: true)
        
    }
    
    func FillData(){
       lblDayes.text = "Sat" ///////
        lblPrice.text = items?._price
        lblTimes.text = "From : \(items!._hour_from)   To : \(items!._hour_to)"
        lblCapacity.text = items?._capacity
        lblLocation.text = items?._address
        lblGroundName.text = items?._name
        lblMatchPlayed.text = "25" //////
        imgGround.loadimageUsingUrlString(url: (items?._image)!)
    }
    

}
