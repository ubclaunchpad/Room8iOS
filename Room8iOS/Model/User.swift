//
//  User.swift
//  Room8iOS
//
//  Created by Aziz Zaynutdinov on 11/10/18.
//  Copyright © 2018 Aziz Zaynutdinov. All rights reserved.
//

import Foundation
 class User {
    var Uid: String = ""
    var FirstName: String = ""
    var LastName: String = ""
    var Email: String = ""
    
    func User(uid: String, firstName: String, lastName: String, email: String) {
    self.Uid = uid;
    self.FirstName = firstName;
    self.LastName = lastName;
    self.Email = email;
    }
}
