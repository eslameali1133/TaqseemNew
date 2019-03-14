//
//  AddPlayerForTeamVC.swift
//  Taqseem
//
//  Created by apple on 2/28/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit
import SwiftyJSON
class AddPlayerForTeamVC: UIViewController {
    var http = HttpHelper()
    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPlayerName: UITextField!
    @IBOutlet var addViewplayer: UIView!
     @IBOutlet weak var tblPlayer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        http.delegate = self
        
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
        if validation(){
            Add()
        }
        addViewplayer.isHidden = true
    }
    
    func validation () -> Bool {
        var isValid = true
        
        
        if (txtPhoneNumber.text?.count)! != 11  {
            Loader.showError(message: AppCommon.sharedInstance.localization("Phone number must be between 7 and 17 characters long"))
            isValid = false
        }
        
        if txtPhoneNumber.text! == "" {
            Loader.showError(message: AppCommon.sharedInstance.localization("Phone field cannot be left blank"))
            isValid = false
        }
        if txtPlayerName.text! == "" { Loader.showError(message: AppCommon.sharedInstance.localization("Name field cannot be left blank"))
            isValid = false
        }
        
        
        return isValid
    }

func Add() {
    let AccessToken = UserDefaults.standard.string(forKey: "access_token")!
    let token_type = UserDefaults.standard.string(forKey: "token_type")!
    
    let params = [
        
        "name":txtPlayerName.text!,
        "phone": txtPhoneNumber.text!
        
        ] as [String: Any]
    
        let headers = [
            "Accept-Type": "application/json" ,
            "Content-Type": "application/json" ,
            "Authorization": "\(token_type) \(AccessToken)"
    ]
    
    
    AppCommon.sharedInstance.ShowLoader(self.view,color: UIColor.hexColorWithAlpha(string: "#000000", alpha: 0.35))
        http.requestWithBody(url: APIConstants.AddMember, method: .post, parameters: params, tag: 1, header: headers)
    }
}

extension AddPlayerForTeamVC: HttpHelperDelegate {
    func receivedResponse(dictResponse: Any, Tag: Int) {
        print(dictResponse)
        AppCommon.sharedInstance.dismissLoader(self.view)
        let json = JSON(dictResponse)
        print(json)
        if Tag == 1 {
            
            let status =  json["status"]
            let message = json["message"]
            let data =  JSON(json["data"])
            
            if status.stringValue == "1" {
                
                
                AppCommon.sharedInstance.saveJSON(json: data, key: "Playerdata")
                
                print(AppCommon.sharedInstance.getJSON("Playerdata")["phone"].stringValue)
                
                Loader.showSuccess(message: message.stringValue)
            } else {
                
                Loader.showError(message: message.stringValue )
            }
        }
        
    }
    func receivedErrorWithStatusCode(statusCode: Int) {
        print(statusCode)
        AppCommon.sharedInstance.alert(title: "Error", message: "\(statusCode)", controller: self, actionTitle: AppCommon.sharedInstance.localization("ok"), actionStyle: .default)
        
        AppCommon.sharedInstance.dismissLoader(self.view)
    }
    func retryResponse(numberOfrequest: Int) {
        
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

