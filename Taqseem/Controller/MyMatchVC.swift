//
//  MyMatchVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/20/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class MyMatchVC: UIViewController {
 
    var item : PlaygroundModelClass!
    @IBOutlet weak var btn_join: UIButton!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var Constain_IconImge_Height: NSLayoutConstraint!
        @IBOutlet weak var Constain_IconImge_Widhtt: NSLayoutConstraint!
    
    @IBOutlet weak var Constain_profileImge_Height: NSLayoutConstraint!
    @IBOutlet weak var Constain_profileImge_Widhtt: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(item._address)
        setupConstrin()
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
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func setupConstrin(){
        Constain_IconImge_Height.constant = view.frame.width / 16
        Constain_IconImge_Widhtt.constant = view.frame.width / 16
        
        Constain_profileImge_Height.constant = view.frame.width / 5.6
        Constain_profileImge_Widhtt.constant = view.frame.width / 5.6
    }
   

}
