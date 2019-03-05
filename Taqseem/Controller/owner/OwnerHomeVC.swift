//
//  OwnerHomeVC.swift
//  Taqseem
//
//  Created by apple on 3/4/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class OwnerHomeVC: UIViewController {

    @IBOutlet weak var TBL_Playground: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TBL_Playground.dataSource = self
        TBL_Playground.delegate = self
        TBL_Playground.changeView()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension OwnerHomeVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  4
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaygroundHomeCell", for: indexPath) as! PlaygroundHomeCell
        cell.contentview.dropShadow()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Owner", bundle:nil)
        let cont = storyBoard.instantiateViewController(withIdentifier: "OwnerMatchDetailsVC")as! OwnerMatchDetailsVC
        self.present(cont, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
