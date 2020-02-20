//
//  LoginViewModel.swift
//  MVVM
//
//  Created by mobileteam on 2/19/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct LoginViewModel {
    var email = BehaviorRelay<String>(value: "")
    var password = BehaviorRelay<String>(value: "")
    
    var validMessage : Observable<String> {
        return Observable.combineLatest(email.asObservable(), password.asObservable()) {
            email, password in
            if email.count == 0 {
                return "You must enter email"
            }else if !email.isValidEmail() {
                return "You must enter valid email"
            }else if password.count == 0 {
                return "You must enter password"
            } else if password.count < 6 {
                return "Password must greater 6 characters"
            }else{
                return "Success"
            }
        }
    }
}
