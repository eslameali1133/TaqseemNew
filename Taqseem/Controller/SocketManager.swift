//
//  SocketManager.swift
//  SocketChatiOS
//
//  Created by Chhaileng Peng on 12/19/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import Foundation
import SocketIO
import SwiftyJSON
var Gmessage : Message!
class SocketManger {
    
    static let shared = SocketManger()
    //io.connect("172.107.175.8:5000",{query:"user_token=token"});
    var http = HttpHelper()
    let socket = SocketIOClient(socketURL: URL(string: "http://172.107.175.8:5000")!, config: [.log(false), .forceWebsockets(true), .connectParams(["user_token":"\(ChatToken)"]) ])
    
    //["query":["user_token":"\(ChatToken)"]]
    //var socket = SocketIOClient(socketURL: URL(string: "172.107.175.8:5000")!, config: [.log(false), .forceWebsockets(true),.connectParams(["query" : "user_token=\(ChatToken)"])])
    public init(){
        http.delegate = self
    }
    
    func connect() {
        socket.connect()
    }
    
    func disconnect() {
        socket.disconnect()
    }
    
    
    func onConnect(handler: @escaping () -> Void) {
        socket.on("connect") { (_, _) in
            handler()
        }
    }
    
//    func userJoinOnConnect(user: User) {
//        let u: [String: String] = ["sessionId": user.user_id, "username": user.from]
//        //self.socket.emit("userJoin", with: [u])
//    }

    func handleNewMessage(handler: @escaping (_ message: Message) -> Void) {
        //socket.on("newMessage") { (data, ack) in
        // Chanel used to listen
        socket.on("listen_message") { (data, ack) in
            print(data)
            //let data = data[0] as! [String: Any]
            let json = JSON(data)
            print(json)
            let from = json[0]["from"]
            let msg = json[0]["msg"]
            let user_id = json[0]["user_id"]
            print(from)
            print(msg)
            print(user_id)
            //user and message model
            let user = User(user_id: user_id.stringValue ,from: from.stringValue)
            let message = Message(user_id: user,msg: msg.stringValue,from: from.stringValue)
            handler(message)
        }
    }
    
    func handleUserTyping(handler: @escaping () -> Void) {
        socket.on("userTyping") { (_, _) in
            handler()
        }
    }
    
    func handleUserStopTyping(handler: @escaping () -> Void) {
        socket.on("userStopTyping") { (_, _) in
            handler()
        }
    }
    
    func handleActiveUserChanged(handler: @escaping (_ count: Int) -> Void) {
        socket.on("count") { (data, ack) in
            let count = data[0] as! Int
            handler(count)
        }
    }
    
    func sendMessage(message: Message) {
//        let msg: [String: Any] = [
//            "user_id": message.user_id,
//            "msg": message.msg,
//            "from": message.from,
//            ]
       // socket.emit("sendMessage", with: [msg])
        
        print(message.from)
        print(message.msg)
        print(message.user_id)
        
        let AccessToken = UserDefaults.standard.string(forKey: "access_token")!
        let token_type = UserDefaults.standard.string(forKey: "token_type")!
        
        let params = [
            "user_id" : message.user_id.user_id,
            "msg" : message.msg
            ] as [String: Any]
        
        let headers = [
            "Accept-Type": "application/json" ,
            "Content-Type": "application/json" ,
            "Authorization" : "\(token_type) \(AccessToken)",
        ]
        
        http.requestWithBody(url: APIConstants.SendMessage, method: .post, parameters: params, tag: 1, header: headers)
        
    }
    
}

extension SocketManger: HttpHelperDelegate {
    func receivedResponse(dictResponse: Any, Tag: Int) {
        print(dictResponse)
        let json = JSON(dictResponse)
        if Tag == 1 {
            
            let isSend =  json["success"]
            
            if isSend == 1 {
                print("success")
                Loader.showSuccess(message: "success")
            }else {
                print("Faild")
                Loader.showError(message: "Faild")
            }
            
        }
        
        }
    
    func receivedErrorWithStatusCode(statusCode: Int) {
        print(statusCode)
    }
    
    func retryResponse(numberOfrequest: Int) {
        
    }
    
    
}


