//
//  AddMatchSegmVC.swift
//  Taqseem
//
//  Created by apple on 2/24/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class AddMatchSegmVC: UIViewController {

     @IBOutlet weak var Segm: AWSegmentAddMatch!
    
    @IBOutlet weak var member: UIView!
    @IBOutlet weak var chat: UIView!
    @IBOutlet weak var Playground: UIView!
    
    @IBAction func Segment(_ sender: AWSegmentAddMatch) {
        switch Segm.selectedIndex
        {
        case 0:
            member.isHidden = false
            chat.isHidden = true
            Playground.isHidden = true
        case 1:
            member.isHidden = true
            Playground.isHidden = true
            chat.isHidden = false
        case 2:
            chat.isHidden = true
            Playground.isHidden = false
            member.isHidden = true
        default:
            break;
        }
        
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        member.isHidden = false
        chat.isHidden = true
        Playground.isHidden = true
       
    }
    

    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Confirm(_ sender: Any) {
      
    let delegate = UIApplication.shared.delegate as! AppDelegate
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let storyboard = UIStoryboard.init(name: "Player", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}
