//
//  OwnerMoreVC.swift
//  Taqseem
//
//  Created by apple on 3/4/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit
class OwnerMoreVC: UIViewController {

    var arrylabelimag = ["Group 1607","Group 1609","Symbol 85 – 1","Symbol 42","terms","ic_exit"]
    var arrylabel1 = ["ADD","ADD","NOFIFICATIONS","SHARE","TERMS &","LOGOUT"]
    var arrylabel2 = ["MATCH","PLAYGROUND","","APP","COUNDITIONS",""]
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgUser: customImageView!{
        didSet{
            imgUser.layer.cornerRadius =  imgUser.frame.width / 2
            imgUser.layer.borderWidth = 1
            //            ProfileImageView.layer.borderColor =  UIColor(red: 0, green: 156, blue: 158, alpha: 1) as! CGColor
            
            imgUser.clipsToBounds = true
            
        }
    }
    @IBOutlet weak var TBL_Menu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = AppCommon.sharedInstance.getJSON("Profiledata")["name"].stringValue
        print(AppCommon.sharedInstance.getJSON("Profiledata")["photo"].stringValue)
        imgUser.loadimageUsingUrlString(url: "\(APIConstants.Base_Image_URL)\(AppCommon.sharedInstance.getJSON("Profiledata")["photo"].stringValue)")
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
                let storyBoard : UIStoryboard = UIStoryboard(name: "Owner", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "OwnerADDMatchVC")as! OwnerADDMatchVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 1 {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Owner", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "AddPlayGroundVC")as! AddPlayGroundVC
                self.present(cont, animated: true, completion: nil)
            }
            else if indexPath.row == 4{
                let storyBoard : UIStoryboard = UIStoryboard(name: "Profile", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "TermsVC")as! TermsVC
                self.present(cont, animated: true, completion: nil)
            }
        
            else if indexPath.row == 5{
                AppCommon.sharedInstance.showlogin(vc: self)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
