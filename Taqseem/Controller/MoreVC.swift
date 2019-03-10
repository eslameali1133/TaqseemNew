//
//  MoreVC.swift
//  Taqseem
//
//  Created by apple on 2/17/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {
    
    
    var arrylabelimagplayer = ["Group 1607","Group 1610","Symbol 85 – 1","Group 1673","Group 1608","Group 1609","Group 1609","star-1","Symbol 83 – 1","Symbol 42","terms","ic_exit"]
    var arrylabel1player = ["ADD","NEAR","NOFIFICATIONS","MY","PLAY","SUGGEST","BOOKING","FAVOURITES","SHARE","SETTING","TERMS &","LOGOUT"]
    var arrylabel2player = ["MATCH","you","","MATCHES","NOW","PLAYGROUND","PLAYGROUND","","APP","","COUNDITIONS",""]
    
    
    var arrylabelimagteam = ["Group 1607","Group 1610","Symbol 85 – 1","Group 1673","Group 1608","Group 1609","Group 1609","Group 170","star-1","Symbol 83 – 1","Symbol 42","terms","ic_exit"]
    var arrylabel1team = ["ADD","NEAR","NOFIFICATIONS","MY","PLAY","SUGGEST","BOOKING","MY","FAVOURITES","SHARE","SETTING","TERMS &","LOGOUT"]
    var arrylabel2team = ["MATCH","you","","MATCHES","NOW","PLAYGROUND","PLAYGROUND","TEAM","","APP","","COUNDITIONS",""]
    
    @IBOutlet weak var TBL_Menu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TBL_Menu.dataSource = self
        TBL_Menu.delegate = self
        TBL_Menu.changeView()
        
        
        // Do any additional setup after loading the view.
    }
    
    
}

extension MoreVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  memberType == "player"
        {
            return arrylabelimagplayer.count
        }else{
            return arrylabelimagteam.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! menuCell
        if  memberType == "player"
        {
            cell.lbl_1.text = arrylabel1player[indexPath.row]
            cell.lbl_2.text = arrylabel2player[indexPath.row]
            cell.iconImageView.image = UIImage(named: arrylabelimagplayer[indexPath.row])
        } else{
            
            cell.lbl_1.text = arrylabel1team[indexPath.row]
            cell.lbl_2.text = arrylabel2team[indexPath.row]
            cell.iconImageView.image = UIImage(named: arrylabelimagteam[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  memberType == "player"
        {
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
            else if indexPath.row == 3 {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "MyMatchesTableVC")as! MyMatchesTableVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 4 {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "BookPlayGroundVC")as! BookPlayGroundVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 6 {
                bookingplayground = true
                let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "BookPlayGroundVC")as! BookPlayGroundVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 7{
                let storyBoard : UIStoryboard = UIStoryboard(name: "Player", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "FavaVC")as! FavaVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 11{
                AppCommon.sharedInstance.showlogin(vc: self)
            }
        }else
            // team action
        {
            
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
            else if indexPath.row == 3 {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "MyMatchesTableVC")as! MyMatchesTableVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 4 {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "BookPlayGroundVC")as! BookPlayGroundVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 6 {
                bookingplayground = true
                let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "BookPlayGroundVC")as! BookPlayGroundVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 7{
                let storyBoard : UIStoryboard = UIStoryboard(name: "TEAM", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "MYTEAMVC")as! MYTEAMVC
                self.present(cont, animated: true, completion: nil)
            }
                
            else if indexPath.row == 8{
                let storyBoard : UIStoryboard = UIStoryboard(name: "Player", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "FavaVC")as! FavaVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 12{
               AppCommon.sharedInstance.showlogin(vc: self)
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
