//
//  LoginVC.swift
//  Taqseem
//
//  Created by apple on 2/6/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit
var memberType = ""
import SwiftyJSON
class LoginVC: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var TXT_UserName: UITextField!
    var http = HttpHelper()
    @IBOutlet weak var Btn_Eng: UIButton!
        {
        didSet{
            Btn_Eng.layer.cornerRadius = Btn_Eng.frame.width / 2
        }
    }
    @IBOutlet weak var Btn_Ar: UIButton!
        {
        didSet{
            Btn_Ar.layer.cornerRadius = Btn_Ar.frame.width / 2
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        http.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    @IBAction func LoginBtn(_ sender: Any) {
        if validation(){
            Login()
        }
        
    }
    func validation () -> Bool {
        var isValid = true
        
        if txtPassword.text! == "" { Loader.showError(message: AppCommon.sharedInstance.localization("Password field cannot be left blank"))
            isValid = false
        }
        
        
        if TXT_UserName.text! == "" {
            Loader.showError(message: AppCommon.sharedInstance.localization("User Name field cannot be left blank"))
            isValid = false
        }
        
        return isValid
    }
    
    func Login() {
        let params = ["user_name":TXT_UserName.text!,"password":txtPassword.text!] as [String: Any]
        let headers = ["Accept": "application/json" , "Content-Type": "application/json"]
        AppCommon.sharedInstance.ShowLoader(self.view,color: UIColor.hexColorWithAlpha(string: "#000000", alpha: 0.35))
        http.requestWithBody(url: APIConstants.Login, method: .post, parameters: params, tag: 1, header: headers)
    }}
        
//        if TXT_UserName.text == "player"
//        {
//            memberType = "player"
//            let delegate = UIApplication.shared.delegate as! AppDelegate
//            //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let storyboard = UIStoryboard.init(name: "Player", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
//        } else if TXT_UserName.text == "team" {
//            memberType = "team"
//            let delegate = UIApplication.shared.delegate as! AppDelegate
//            //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let storyboard = UIStoryboard.init(name: "Player", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
//        }else{
//            
//            let delegate = UIApplication.shared.delegate as! AppDelegate
//            //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let storyboard = UIStoryboard.init(name: "Owner", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
//        }
    
    extension LoginVC: HttpHelperDelegate {
        func receivedResponse(dictResponse: Any, Tag: Int) {
            print(dictResponse)
            AppCommon.sharedInstance.dismissLoader(self.view)
            
            let json = JSON(dictResponse)
            
            let forbiddenMail : String = AppCommon.sharedInstance.localization("Username")
            if Tag == 1 {
                
                let status =  json["status"]
                let access_token = json["access_token"]
                let token_type = json["token_type"]
               // let data = json["data"]
                let data =  JSON(json["data"])
                print(status)
                print(access_token)
                print(token_type)
                print(data)
                
                print(json["status"])
                if status.stringValue  == "1" {
                    UserDefaults.standard.set(access_token.stringValue, forKey: "access_token")
                    UserDefaults.standard.set(token_type.stringValue, forKey: "token_type")
                    UserDefaults.standard.set(data.array, forKey: "Profiledata")
                    UserDefaults.standard.array(forKey: "Profiledata")
                   // print(data["email"])
                    
                    SharedData.SharedInstans.SetIsLogin(true)
                    if data["type"] == "user" {
                        let delegate = UIApplication.shared.delegate as! AppDelegate
                      //  let storyboard = UIStoryboard(name: "StoryBord", bundle: nil)
                        let storyboard = UIStoryboard.init(name: "Player", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
                    }else{
                        let delegate = UIApplication.shared.delegate as! AppDelegate
                       // let storyboard = UIStoryboard(name: "StoryBord", bundle: nil)
                        let storyboard = UIStoryboard.init(name: "Owner", bundle: nil); delegate.window?.rootViewController = storyboard.instantiateInitialViewController()
                    }
                }else if status.stringValue  == "4" {
                    Loader.showError(message: AppCommon.sharedInstance.localization("check your email or password"))
                }
                else {
                    
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

