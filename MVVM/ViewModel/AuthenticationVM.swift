//
//  Authentication.swift
//  WebViewiOSDemo
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation

class AuthenticationVM: NSObject {
    
    var user : User!
    var email : String {return user.email}
    var pass : String {return user.pass}
    
    typealias authenticationLoginCallBack = (_ status : Bool, _ message: String) -> ()
    
    var loginCallBack : authenticationLoginCallBack?
    
    func authenticateUserWith(_ email : String, andPass pass : String) -> () {
        if email.count != 0 {
            if pass.count != 0 {
                verifyUserWith(email, andPass : pass)
            }else{
                //MARK: password is empty
                self.onLoginCallBack(false, "Pass shouldn't be empty")
            }
        }else{
            //MARK: email is emtpy
            self.onLoginCallBack(false, "Email shouldn't be empty")
        }
    }
    
    fileprivate func verifyUserWith(_ email : String, andPass pass : String){
        if email == "Admin" && pass == "admin" {
            user = User(email: email, pass: pass)
            self.onLoginCallBack(true, "Successfully")
        }else{
            //Invalid credentails
            self.onLoginCallBack(true, "Please enter correct credentails")
        }
    }
    
    fileprivate func onLoginCallBack(_ status : Bool, _ message: String){
        guard let call = self.loginCallBack else { return }
        call(status,message)
    }
    
    //MARK: - Login Completion handler
    func loginCompletionHandler(callback : @escaping authenticationLoginCallBack){
        self.loginCallBack = callback
    }
}
