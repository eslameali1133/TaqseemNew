//
//  AddNewVisaVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/22/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class AddNewVisaVC: UIViewController {
    
    @IBOutlet weak var txtCardName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
