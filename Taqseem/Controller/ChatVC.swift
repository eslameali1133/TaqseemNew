//
//  ChatVC.swift
//  Taqseem
//
//  Created by apple on 2/17/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var TBL_Chat: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        TBL_Chat.dataSource = self
        TBL_Chat.delegate = self
         TBL_Chat.changeView()
        // Do any additional setup after loading the view.
    }
    


}

extension ChatVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CahtCell", for: indexPath) as! CahtCell
    cell.lbl_chatCounter.text = "4"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        print(123)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

