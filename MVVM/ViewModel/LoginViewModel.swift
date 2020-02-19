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
    
    var isValid : Observable<Bool> {
        return Observable.combineLatest(email.asObservable(), password.asObservable()) {
            email, password in
            email.count >= 3 && password.count >= 3
        }
    }
}
