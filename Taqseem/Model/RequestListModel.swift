//
//  RequestListModel.swift
//  Taqseem
//
//  Created by Husseinomda16 on 3/18/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import Foundation
import UIKit

class RequestListModelClass: NSObject {
    var _ground_id = ""
    var _ground_image = ""
    var _ground_name = ""
    var _user_name = ""
    var _capacity = ""
    var _reservation_no = ""
    var _duration = ""
    var _date = ""
    var _time = ""
    var _reservation_type = ""
    var _reservation_status = ""
    var _photo = ""
    
    init(ground_id : String , ground_image : String , ground_name : String ,user_name : String ,capacity :String , reservation_no :String,duration:String,date:String,time:String,reservation_type:String,reservation_status:String,photo:String) {
        
        self._ground_id = ground_id
        self._ground_image = ground_image
        self._ground_name = ground_name
        self._user_name = user_name
        self._capacity = capacity
        self._reservation_no = reservation_no
        self._duration = duration
        self._date = date
        self._time = time
        self._reservation_type = reservation_type
        self._reservation_status = reservation_status
        self._photo = photo
    }
}
