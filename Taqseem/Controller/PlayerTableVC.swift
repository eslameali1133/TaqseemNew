//
//  PlayerTableVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/20/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit
 var COMEFROMNear = false
class PlayerTableVC: UIViewController {
    

    @IBOutlet weak var headerview: UIView!
    @IBOutlet weak var Tbl_Top_Constrain: NSLayoutConstraint!
    @IBOutlet weak var tblPlayer: UITableView!
    var comfrom = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if COMEFROMNear == false
        {
            headerview.isHidden = true

            Tbl_Top_Constrain.constant = 0
        }else{
            COMEFROMNear = false
            headerview.isHidden = false
        }
        tblPlayer.dataSource = self
        tblPlayer.delegate = self
        tblPlayer.changeView()

        // Do any additional setup after loading the view.
    }
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
    extension PlayerTableVC :UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  10
            
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
            let cont = storyBoard.instantiateViewController(withIdentifier: "MyMatchVC")as! MyMatchVC
            self.present(cont, animated: true, completion: nil)
            print(123)
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 95
        }
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 5
        }
        
        func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return UIView.init(frame: CGRect.zero)
        }
        func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 5
        }
        
        func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            return UIView.init(frame: CGRect.zero)
        }
         
}
