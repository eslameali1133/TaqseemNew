//
//  FavaVC.swift
//  Taqseem
//
//  Created by apple on 2/18/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class FavaVC: UIViewController {
@IBOutlet weak var TBL_FAV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TBL_FAV.dataSource = self
        TBL_FAV.delegate = self
        TBL_FAV.changeView()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   

}

extension FavaVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  4
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAVOURITESCell", for: indexPath) as! FAVOURITESCell
      
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
