//
//  OwnerNextMatchVC.swift
//  Taqseem
//
//  Created by apple on 3/4/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class OwnerNextMatchVC: UIViewController {

  
    @IBOutlet weak var tblMyMatch: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblMyMatch.dataSource = self
        tblMyMatch.delegate = self
        tblMyMatch.changeView()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}

extension OwnerNextMatchVC :UITableViewDelegate,UITableViewDataSource{
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyMatchCell", for: indexPath) as! MyMatchCell
        cell.viewcontent.dropShadow()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "MyMatchVC")as! MyMatchVC
     
        cont.title = "MATCH DETAILS"
        self.present(cont, animated: true, completion: nil)
        print(123)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
}

