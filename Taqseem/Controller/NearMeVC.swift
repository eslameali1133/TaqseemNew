//
//  NearMeVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/24/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit
var comedromneartoplay = false
class NearMeVC: UIViewController  , UIPickerViewDataSource , UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }

    

    @IBOutlet weak var pickerDate: UIDatePicker!
    @IBOutlet weak var lblDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func Search_Reaseult(_ sender: Any) {
        comedromneartoplay = true
        let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "ChoosePlaygroundVC")as! ChoosePlaygroundVC
        self.present(cont, animated: true, completion: nil)
    }
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
