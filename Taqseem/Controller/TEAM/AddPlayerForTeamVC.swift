//
//  AddPlayerForTeamVC.swift
//  Taqseem
//
//  Created by apple on 2/28/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class AddPlayerForTeamVC: UIViewController {
  @IBOutlet var addViewplayer: UIView!
     @IBOutlet weak var tblPlayer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblPlayer.dataSource = self
        tblPlayer.delegate = self
        tblPlayer.changeView()
        
        addViewplayer.isHidden = true
        DispatchQueue.main.async {
            self.addViewplayer.frame = CGRect.init(x: 10,
                                                    y: 0, width: self.view.frame.width, height: self.view.frame.height)
//            self.addViewplayer.center = self.view.center
            self.view.addSubview(self.addViewplayer)
        }
        

        // Do any additional setup after loading the view.
    }
    @IBAction func AddPlayerBTN(_ sender: Any) {
     addViewplayer.isHidden = false
    }
    
    @IBAction func ADD_btn(_ sender: Any) {
        addViewplayer.isHidden = true
    }

}


extension AddPlayerForTeamVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  6
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
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

