//
//  LogInViewModel.swift
//  Rx_Login
//
//  Created by Keval Patel on 5/4/19.
//  Copyright © 2019 Keval Patel. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
class LogInViewModel{
    var emailText = BehaviorRelay<String>(value: "")
    var passwordText = BehaviorRelay<String>(value: "")
    var isValid : Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable(), resultSelector: { email, password in
            self.emailText.value.count >= 10 && self.passwordText.value.count >= 2
        })
        
    }
}

