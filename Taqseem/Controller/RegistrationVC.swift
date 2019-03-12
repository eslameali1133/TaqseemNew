//
//  RegistrationVC.swift
//  Taqseem
//
//  Created by apple on 2/7/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit
import SwiftyJSON
class RegistrationVC: UIViewController {
    var http = HttpHelper()
    var type = "user"
    var facebook_id = ""
    var ComeFromFaceBook = false
    
    @IBOutlet weak var passWordView: UIView!
    @IBOutlet weak var passConfirmWordView: UIView!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var btnOwner: UIButton!
    @IBOutlet weak var btnTeam: UIButton!
    @IBOutlet weak var btnPlayer: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        http.delegate = self
        
        if ComeFromFaceBook == true
        {
            passWordView.isHidden = true
             passConfirmWordView.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPlayer(_ sender: Any) {
        type = "user"
        btnPlayer.setTitleColor(.white, for: .normal)
        btnTeam.setTitleColor(.darkGray, for: .normal)
        btnOwner.setTitleColor(.darkGray, for: .normal)
    }
    
    @IBAction func btnTeam(_ sender: Any) {
        type = "team"
        btnPlayer.setTitleColor(.darkGray, for: .normal)
        btnTeam.setTitleColor(.white, for: .normal)
        btnOwner.setTitleColor(.darkGray, for: .normal)
    }
    
    @IBAction func btnOwner(_ sender: Any) {
        type = "ground_owner"
        btnPlayer.setTitleColor(.darkGray, for: .normal)
        btnTeam.setTitleColor(.darkGray, for: .normal)
        btnOwner.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        
        if validation(){
            print("valid")
            signup ()
        }
    }

    
    
    func validation () -> Bool {
        var isValid = true
        
        if ComeFromFaceBook == true
        {

        }else{
            if txtPassword.text! != txtPassword.text { Loader.showError(message: AppCommon.sharedInstance.localization("Password and Confirm password is not match!"))
                isValid = false
            }
            
            if (txtPassword.text?.count)! < 6 { Loader.showError(message: AppCommon.sharedInstance.localization("Password must be at least 6 characters long"))
                isValid = false
            }
            if txtPassword.text! == "" { Loader.showError(message: AppCommon.sharedInstance.localization("Password field cannot be left blank"))
                isValid = false
            }
            
        }
        
      
        
        if (txtPhoneNumber.text?.count)! != 11  {
            Loader.showError(message: AppCommon.sharedInstance.localization("Phone number must be between 7 and 17 characters long"))
            isValid = false
        }
        
        if txtPhoneNumber.text! == "" {
            Loader.showError(message: AppCommon.sharedInstance.localization("Phone field cannot be left blank"))
            isValid = false
        }
        if txtName.text! == "" { Loader.showError(message: AppCommon.sharedInstance.localization("Name field cannot be left blank"))
            isValid = false
        }
        if txtUserName.text! == "" { Loader.showError(message: AppCommon.sharedInstance.localization("Name field cannot be left blank"))
            isValid = false
        }
        if txtEmail.text! == "" { Loader.showError(message: AppCommon.sharedInstance.localization("Name field cannot be left blank"))
            isValid = false
        }
        
        
        return isValid
    }
    
    
    func signup () {
        
        if ComeFromFaceBook == true
        {
            
            let params = ["name":txtName.text!, "email":txtEmail.text!,"user_name":txtUserName.text!,"facebook_id": facebook_id,"phone": txtPhoneNumber.text! , "type": type] as [String: Any]
            let headers = ["Accept-Type": "application/json" , "Content-Type": "application/json"]
            AppCommon.sharedInstance.ShowLoader(self.view,color: UIColor.hexColorWithAlpha(string: "#000000", alpha: 0.35))
            http.requestWithBody(url: APIConstants.facebookregister, method: .post, parameters: params, tag: 1, header: headers)
            
            
        }else{
            let params = ["name":txtName.text!, "email":txtEmail.text!,"user_name":txtUserName.text!,"password": txtPassword.text!,"phone": txtPhoneNumber.text! , "type": type] as [String: Any]
            let headers = ["Accept-Type": "application/json" , "Content-Type": "application/json"]
            AppCommon.sharedInstance.ShowLoader(self.view,color: UIColor.hexColorWithAlpha(string: "#000000", alpha: 0.35))
            http.requestWithBody(url: APIConstants.Register, method: .post, parameters: params, tag: 1, header: headers)
        }
       
    }
}
extension RegistrationVC: HttpHelperDelegate {
    func receivedResponse(dictResponse: Any, Tag: Int) {
        print(dictResponse)
        AppCommon.sharedInstance.dismissLoader(self.view)
        let json = JSON(dictResponse)
        
        let forbiddenMail : String = AppCommon.sharedInstance.localization("Duplicated user")
        if Tag == 1 {
        
            let status =  json["status"]
            let message = json["message"]
            let access_token = json["access_token"]
            let token_type = json["token_type"]
            // let data = json["data"]
            let data =  JSON(json["data"])
            let expires_at = json["expires_at"]
            let code = json["code"]
            print(data)
            print(code)
            //print(json["status"])
            if status.stringValue == "2" {
                
                UserDefaults.standard.set(access_token.stringValue, forKey: "access_token")
                UserDefaults.standard.set(token_type.stringValue, forKey: "token_type")
                UserDefaults.standard.set(data.array, forKey: "Profiledata")
                UserDefaults.standard.set(expires_at.stringValue, forKey: "expires_at")
                UserDefaults.standard.set(code.stringValue, forKey: "code")
                UserDefaults.standard.array(forKey: "Profiledata")
                
                
                if type == "user" {
                    let delegate = UIApplication.shared.delegate as! AppDelegate
                    //  let storyboard = UIStoryboard(name: "StoryBord", bundle: nil)
                    let storyboard = UIStoryboard.init(name: "Player", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
                }else if type == "team"{
                    let delegate = UIApplication.shared.delegate as! AppDelegate
                    // let storyboard = UIStoryboard(name: "StoryBord", bundle: nil)
                    let storyboard = UIStoryboard.init(name: "Player", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
                }else{
                    let delegate = UIApplication.shared.delegate as! AppDelegate
                    // let storyboard = UIStoryboard(name: "StoryBord", bundle: nil)
                    let storyboard = UIStoryboard.init(name: "Owner", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
                    
            }
            }else if status.stringValue == "5"{
                if message == "The user name has already been taken."{
                Loader.showError(message:AppCommon.sharedInstance.localization("The user name has already been taken."))
                }else if message=="The phone has already been taken."{
                    Loader.showError(message:AppCommon.sharedInstance.localization("The phone has already been taken."))
                }else{
                   Loader.showError(message: AppCommon.sharedInstance.localization("The Email has already been taken."))
                }
            } else {
                
                Loader.showError(message: (forbiddenMail))
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
