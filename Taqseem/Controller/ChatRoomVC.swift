//
//  ChatRoomVC.swift
//  Taqseem
//
//  Created by apple on 2/24/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class ChatRoomVC: UIViewController {

     @IBOutlet weak var TBL_Chatroom: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TBL_Chatroom.dataSource = self
        TBL_Chatroom.delegate = self
        TBL_Chatroom.changeView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ChatRoomVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SendCell", for: indexPath) as! SendCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print(123)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

