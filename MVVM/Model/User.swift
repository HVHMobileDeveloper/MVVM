//
//  User.swift
//  WebViewiOSDemo
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
struct User {
    var email : String
    var pass : String
    
    init(email : String, pass: String) {
        self.email = email
        self.pass = pass
    }
}
