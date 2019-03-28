//
//  CountryModel.swift
//  Taqseem
//
//  Created by apple on 3/20/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import Foundation

class CityModelClass: NSObject {
    var id = ""
    var name_en = ""
    var name_ar = ""
    var name = ""
   
    init(id:String , name_en : String , name_ar : String , name : String) {
        self.id = id
        self.name_en = name_en
        self.name_ar = name_ar
        self.name = name
        
    }
}

class AreaModelClass: NSObject {
    var id = ""
    var name_en = ""
    var name_ar = ""
    var name = ""
    
    init(id:String , name_en : String , name_ar : String , name : String) {
        self.id = id
        self.name_en = name_en
        self.name_ar = name_ar
        self.name = name
       
    }
}


class OwnerPlaygroundModelClass: NSObject {
    var id = ""
    var name_en = ""
    var name_ar = ""
    
    
    init(id:String , name_en : String , name_ar : String) {
        self.id = id
        self.name_en = name_en
        self.name_ar = name_ar
       
        
    }
}




class DayModel: NSObject {
    var index = 0
    var name = ""
    var isselected = false
    
}

