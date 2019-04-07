//
//  ViewController.swift
//  MaakMaak
//
//  Created by M on 2/5/19.
//  Copyright © 2019 M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     @IBOutlet weak var addmatch: UIView!
     @IBOutlet weak var mymatch: UIView!
     @IBOutlet weak var Sucplayground: UIView!
    
    @IBOutlet weak var bookinglayground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comedromneartoplay = ""
        addmatch.dropShadow()
        mymatch.dropShadow()
        Sucplayground.dropShadow()
        bookinglayground.dropShadow()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func btnNearYou(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "NearMeVC")as! NearMeVC
        self.present(cont, animated: true, completion: nil)

    }
    @IBAction func playnow_btn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "BookPlayGroundVC")as! BookPlayGroundVC
        cont.FilterType = ""
        self.present(cont, animated: true, completion: nil)
    }
    
    @IBAction func addmatch_btn(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "AddMatchVC")as! AddMatchVC
        self.present(cont, animated: true, completion: nil)
    }
    @IBAction func Mymatch_btn(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "MyMatchesTableVC")as! MyMatchesTableVC
        self.present(cont, animated: true, completion: nil)
    }
    @IBAction func booking_btn(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "BookPlayGroundVC")as! BookPlayGroundVC
        cont.FilterType = "None"
        self.present(cont, animated: true, completion: nil)
    }
    
}

