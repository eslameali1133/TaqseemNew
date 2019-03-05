//
//  ChoosePlaygroundVC.swift
//  Taqseem
//
//  Created by apple on 2/24/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class ChoosePlaygroundVC: UIViewController {
@IBOutlet weak var TBL_Background: UITableView!
    
     @IBOutlet weak var lbl_title: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if comedromneartoplay == true
        {
            
            lbl_title.text = "NEAR ME"
        }
        TBL_Background.dataSource = self
        TBL_Background.delegate = self
        TBL_Background.changeView()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func btn_choose(_ sender: UIButton) {
        if comedromneartoplay == true
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
            let cont = storyBoard.instantiateViewController(withIdentifier: "MyMatchVC")as! MyMatchVC
            self.present(cont, animated: true, completion: nil)
            
        }else{
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
            let cont = storyBoard.instantiateViewController(withIdentifier: "playGroundDetailsVC")as! playGroundDetailsVC
            self.present(cont, animated: true, completion: nil)
            
        }
    }
    
    

}
extension ChoosePlaygroundVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  4
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoosebackgroundCell", for: indexPath) as! ChoosebackgroundCell
        cell.contentView.dropShadow()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print(123)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
