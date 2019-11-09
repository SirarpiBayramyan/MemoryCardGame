//
//  User.swift
//  Concentration
//
//  Created by Sirarpi on 11/7/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

class User: NSObject {
    
    static let sharedUser = User(userName: "Jhony", password:"a" , score:0, email: "a")
    
    var userName: String
    var password:String
    var email: String
    @objc dynamic var score: Int
    

    
    init(userName: String,password: String, score: Int, email: String) {
        self.userName = userName
        self.password = password
        self.score = score
        self.email = email
    }
}
