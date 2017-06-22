//
//  ViewModel.swift
//  ReactiveLogin
//
//  Created by Nicolas Suarez-Canton Trueba on 6/22/17.
//  Copyright © 2017 Nicolas Suarez-Canton Trueba. All rights reserved.
//

import Foundation
import ReactiveSwift

enum LoginError: Error {
    case loginError
    case noError
}

class ViewModel {
    let emailAddress = MutableProperty<String?>(nil)
    let password = MutableProperty<String?>(nil)
    
    let isEmailAddressValid: Property<Bool>
    let isPasswordValid: Property<Bool>
    
    let isValid: Property<Bool>
    let submit: Action<(String?, String?), String, LoginError>
    
    init() {
        self.isEmailAddressValid = emailAddress.map {
            return ($0 ?? "").characters.count > 0
        }
        self.isPasswordValid = password.map {
            return($0 ?? "").characters.count > 0
        }
        
        self.isValid = Property.combineLatest(self.isEmailAddressValid, self.isPasswordValid).map { (isEmailAddressValid, isPasswordValid) in
            return isEmailAddressValid && isPasswordValid
        }
        
        self.submit = Action(enabledIf: self.isValid) { input in
            print("Submit with email \(String(describing: input.0)) and address \(String(describing: input.1))")
            return SignalProducer<String, LoginError>(value: "")
        }
        
        self.emailAddress <~ self.submit.values
        self.password <~ self.submit.values
        
    }
}
