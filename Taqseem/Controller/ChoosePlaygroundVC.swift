//
//  ChoosePlaygroundVC.swift
//  Taqseem
//
//  Created by apple on 2/24/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class ChoosePlaygroundVC: UIViewController {
@IBOutlet weak var TBL_Background: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TBL_Background.dataSource = self
        TBL_Background.delegate = self
        TBL_Background.changeView()
        // Do any additional setup after loading the view.
    }
   

}
extension ChoosePlaygroundVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  4
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoosebackgroundCell", for: indexPath) as! ChoosebackgroundCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print(123)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
