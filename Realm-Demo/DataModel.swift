//
//  DataModel.swift
//  Realm-Demo
//
//  Created by Amin  on 6/26/21.
//  Copyright © 2021 AhmedAmin. All rights reserved.
//

import Foundation
import RealmSwift



@objcMembers class DataModel: Object {
    
    dynamic var name: String = " "
    dynamic var talePhoneNumber = " "
    dynamic var _id: ObjectId = ObjectId.generate()
    
    convenience init(name: String, telephoneNumber: String, _id: String) {
        self.init()
        self.name = name
        self.talePhoneNumber = telephoneNumber
        
    }
    
    override class func primaryKey() -> String? {
        return "_id"
    }
    
}
