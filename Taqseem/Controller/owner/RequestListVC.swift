//
//  RequestListVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 3/6/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class RequestListVC: UIViewController {

    @IBOutlet weak var tblRequestDetails: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tblRequestDetails.delegate = self
        tblRequestDetails.dataSource = self
        // Do any additional setup after loading the view.
    }
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }}

    extension RequestListVC :UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  4
            
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RequestDetailCell", for: indexPath) as! RequestDetailCell
            cell.cntntView.dropShadow()
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Owner", bundle:nil)
            let cont = storyBoard.instantiateViewController(withIdentifier: "RequestDetailsVC")as! RequestDetailsVC
            self.present(cont, animated: true, completion: nil)
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 170
        }
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
}
