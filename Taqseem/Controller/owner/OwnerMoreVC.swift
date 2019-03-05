//
//  OwnerMoreVC.swift
//  Taqseem
//
//  Created by apple on 3/4/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class OwnerMoreVC: UIViewController {

    var arrylabelimag = ["Group 1607","Group 1609","Symbol 85 – 1","Symbol 83 – 1","Symbol 42","terms","ic_exit"]
    var arrylabel1 = ["ADD","ADD","NOFIFICATIONS","SHARE","SETTING","TERMS &","LOGOUT"]
    var arrylabel2 = ["MATCH","PLAYGROUND","","APP","","COUNDITIONS",""]
    
    
    @IBOutlet weak var TBL_Menu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TBL_Menu.dataSource = self
        TBL_Menu.delegate = self
        TBL_Menu.changeView()
        
        
        // Do any additional setup after loading the view.
    }
    
    
}

extension OwnerMoreVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return arrylabelimag.count
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! menuCell
       
            cell.lbl_1.text = arrylabel1[indexPath.row]
            cell.lbl_2.text = arrylabel2[indexPath.row]
            cell.iconImageView.image = UIImage(named: arrylabelimag[indexPath.row])
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            if indexPath.row == 0 {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "AddMatchVC")as! AddMatchVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 1 {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "NearMeVC")as! NearMeVC
                self.present(cont, animated: true, completion: nil)
            }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
