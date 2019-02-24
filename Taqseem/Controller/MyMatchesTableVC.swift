//
//  MyMatchesTableVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/20/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class MyMatchesTableVC: UIViewController {
var comfrom = ""
    
     @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var tblMyMatch: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if comfrom == "Near"{
            lbl_title.text = "NEAR YOU"
        }
        tblMyMatch.dataSource = self
        tblMyMatch.delegate = self
        tblMyMatch.changeView()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}

    extension MyMatchesTableVC :UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  10
            
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyMatchCell", for: indexPath) as! MyMatchCell
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
                let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "MyMatchVC")as! MyMatchVC
                self.present(cont, animated: true, completion: nil)
                print(123)
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 121
        }
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        //func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          //  return 20
        //}
       // func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         //   return 20
        //}
        
        // Make the background color show through
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    }

