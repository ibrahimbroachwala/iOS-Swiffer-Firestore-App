//
//  Sweet.swift
//  firestoreapp
//
//  Created by Apple on 8/21/18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import Foundation
import Firebase


protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}

struct Sweet {
    var name: String
    var message: String
    var timeStamp: Date
    
    var dictionary:[String:Any] {
        return[
            "name": name,
            "message": message,
            "timeStamp": timeStamp
        ]
    }
}

extension Sweet: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let message = dictionary["message"] as? String,
            let timeStamp = dictionary["timeStamp"] as? Date else {return nil}
        
        self.init(name: name, message: message, timeStamp: timeStamp)
    }
}
