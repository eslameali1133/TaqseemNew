//
//  PlayerModel.swift
//  Taqseem
//
//  Created by Husseinomda16 on 3/17/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import Foundation
import UIKit

class PlayerModelClass: NSObject {
    var _PlayerName = ""
    var _PlayerId = ""
    var _PlayerPhone = ""
    var _PlayerTeamID = ""
    var _CreatedDate = ""
    var _UpdatedDate = ""
    init(PlayerName:String , PlayerId : String , PlayerPhone : String , PlayerTeamId : String , CreatedDate :String , UpdatedDate :String) {
        self._PlayerName = PlayerName
        self._CreatedDate = CreatedDate
        self._PlayerId = PlayerId
        self._PlayerPhone = PlayerPhone
        self._PlayerTeamID = PlayerTeamId
        self._UpdatedDate = UpdatedDate
    }
}
