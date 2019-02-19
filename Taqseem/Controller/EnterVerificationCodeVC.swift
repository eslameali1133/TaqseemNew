//
//  EnterVerificationCodeVC.swift
//  Taqseem
//
//  Created by apple on 2/6/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class EnterVerificationCodeVC: UIViewController {

    @IBOutlet weak var Text1: UITextField!
        {
        didSet{
            Text1.layer.cornerRadius = Text1.frame.width / 2
            Text1.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var Text2: UITextField!
        {
        didSet{
            Text2.layer.cornerRadius = Text2.frame.width / 2
              Text2.clipsToBounds = true
        }
    }
    @IBOutlet weak var Text3: UITextField!
        {
        didSet{
            Text3.layer.cornerRadius = Text3.frame.width / 2
              Text3.clipsToBounds = true
        }
    }
    @IBOutlet weak var Text4: UITextField!
        {
        didSet{
            Text4.layer.cornerRadius = Text4.frame.width / 2
              Text4.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
