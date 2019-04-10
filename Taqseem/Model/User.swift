//
//  User.swift
//  SocketChatiOS
//
//  Created by Chhaileng Peng on 12/19/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import Foundation

class User: CustomStringConvertible {
    //var sessionId: String
    var from: String
    var user_id: String
    
    init(user_id: String, from: String) {
        self.user_id = user_id
        self.from = from
    }
    
    var description: String {
        return "[user_id: \(user_id), from: \(from)]"
    }
}
