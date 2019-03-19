//
//  RequestPlayerModel.swift
//  Taqseem
//
//  Created by Husseinomda16 on 3/19/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import Foundation
import UIKit

class RequestPlayerModelClass: NSObject {
    var _id = ""
    var _name = ""
    var _photo = ""
    var _position = ""
    var _position1 = ""
        init(id:String , name : String , photo : String , position : String , position1 :String ) {
            self._id = id
            self._name = name
            self._photo = photo
            self._position = position
            self._position1 = position1
    }
}
