//
//  Message.swift
//  SocketChatiOS
//
//  Created by Chhaileng Peng on 12/19/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import Foundation

class Message: CustomStringConvertible {
    
    var user_id: User
    var msg: String
    var from : String
    
    init(user_id: User, msg: String , from: String) {
        self.user_id = user_id
        self.msg = msg
        self.from = from
    }
    
    var description: String {
        return "[user_id: \(user_id), msg: \(msg), from: \(from)]"
    }
}
