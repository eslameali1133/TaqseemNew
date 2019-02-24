//
//  PaidVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/22/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class PaidVC: UIViewController {

    @IBOutlet weak var VisaView: UIView!
    @IBOutlet weak var cashView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func Btn_cash(_ sender: Any) {
        cashView.backgroundColor = UIColor(red: 37, green: 159, blue: 161, alpha: 1)
         VisaView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
    

    @IBAction func btn_visa(_ sender: Any) {
           VisaView.backgroundColor = UIColor(red: 37, green: 159, blue: 161, alpha: 1)
        
        cashView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "AddNewVisaVC")as! AddNewVisaVC
        self.present(cont, animated: true, completion: nil)
        
    }
}
