//
//  APIConstants.swift
//  CarWash
//
//  Created by Mohammad Farhan on 22/12/1710/11/17.
//  Copyright © 2017 CarWash. All rights reserved.
//

import Foundation

open class APIConstants {
   static let SERVER_URL = "http://172.107.175.8/api/"
//   static let SERVER_URL = "http://192.168.1.111:8080/cartime-1.1/cartime/api/"
    
    static let Login = SERVER_URL + "login"
    static let Register = SERVER_URL + "register"
    static let ResentCode = SERVER_URL + "resend-code"
    static let SendCode = SERVER_URL + "send-code"
    static let ResetPassword = SERVER_URL + "reset-password"
    
}
