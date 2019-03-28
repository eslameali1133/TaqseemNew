//
//  MatchDetailsModel.swift
//  Taqseem
//
//  Created by Husseinomda16 on 3/21/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import Foundation
import UIKit

class MatchDetailsModelClass: NSObject {
    var _Time = ""
    var _PTime = ""
    var _Date = ""
    var _Duration = ""
    var _Capacity = ""
    var _Salary = ""
    var _Notes = ""
    init(Time:String , PTime:String , Date : String , Duration : String , Capacity : String , Salary : String , Notes :String ) {
         self._Time = Time
        self._PTime = PTime
         self._Date = Date
         self._Duration = Duration
        self._Capacity = Capacity
         self._Salary = Salary
         self._Notes = Notes
    }
}
