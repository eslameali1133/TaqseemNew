
//  OwnerMatchDetailsVC.swift
//  Taqseem
//  Created by apple on 3/4/19.
//  Copyright © 2019 OnTime. All rights reserved.


import UIKit

class OwnerMatchDetailsVC: UIViewController {
    var items : PlaygroundModelClass!
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_previc: UIButton!
    @IBOutlet weak var btn_info: UIButton!
    
    
    @IBOutlet weak var Next: UIView!
    @IBOutlet weak var Previce: UIView!
    @IBOutlet weak var info: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Next.isHidden = false
        Previce.isHidden = true
        info.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func btnnextAC(_ sender: Any) {
        Next.isHidden = false
        Previce.isHidden = true
        info.isHidden = true
        
        btn_next.setTitleColor(.white, for: .normal)
        btn_previc.setTitleColor(.darkGray, for: .normal)
        btn_info.setTitleColor(.darkGray, for: .normal)
        
        
    }
    @IBAction func btnPreviceAC(_ sender: Any) {
        Next.isHidden = true
        Previce.isHidden = false
        info.isHidden = true
        
        btn_next.setTitleColor(.darkGray, for: .normal)
        btn_previc.setTitleColor(.white, for: .normal)
        btn_info.setTitleColor(.darkGray, for: .normal)
        
    }
    @IBAction func btninfoAC(_ sender: Any) {
        Next.isHidden = true
        Previce.isHidden = true
        info.isHidden = false
        btn_next.setTitleColor(.darkGray, for: .normal)
        btn_previc.setTitleColor(.darkGray, for: .normal)
        btn_info.setTitleColor(.white, for: .normal)
        
    }
    
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
}
