//
//  MyMatchVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/20/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class MyMatchVC: UIViewController {

    @IBOutlet weak var Constain_IconImge_Height: NSLayoutConstraint!
        @IBOutlet weak var Constain_IconImge_Widhtt: NSLayoutConstraint!
    
    @IBOutlet weak var Constain_profileImge_Height: NSLayoutConstraint!
    @IBOutlet weak var Constain_profileImge_Widhtt: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstrin()
        
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
