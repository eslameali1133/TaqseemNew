//
//  BookPlayGroundVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/24/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class BookPlayGroundVC: UIViewController {
    var PickerFlag = ""
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var Duration = [0 , 15 , 30 , 45 , 60 , 75 , 90 , 105 , 120]
    var TeamCapacity = [0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12]
    var Fees = [0 , 1,2,3,4,5,6,7,8,9,10]
    @IBOutlet weak var txtDuration: UITextField!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
