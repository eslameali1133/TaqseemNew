//
//  LoginVC.swift
//  Taqseem
//
//  Created by apple on 2/6/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit
var memberType = ""
class LoginVC: UIViewController {

    @IBOutlet weak var TXT_UserName: UITextField!
    
    @IBOutlet weak var Btn_Eng: UIButton!
        {
        didSet{
            Btn_Eng.layer.cornerRadius = Btn_Eng.frame.width / 2
        }
    }
    @IBOutlet weak var Btn_Ar: UIButton!
        {
        didSet{
            Btn_Ar.layer.cornerRadius = Btn_Ar.frame.width / 2
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    @IBAction func LoginBtn(_ sender: Any) {
        
        if TXT_UserName.text == "player"
        {
            memberType = "player"
            let delegate = UIApplication.shared.delegate as! AppDelegate
            //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let storyboard = UIStoryboard.init(name: "Player", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
        } else if TXT_UserName.text == "team" {
            memberType = "team"
            let delegate = UIApplication.shared.delegate as! AppDelegate
            //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let storyboard = UIStoryboard.init(name: "Player", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
        }else{
            
            let delegate = UIApplication.shared.delegate as! AppDelegate
            //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let storyboard = UIStoryboard.init(name: "Owner", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
        }
    }
    

}
