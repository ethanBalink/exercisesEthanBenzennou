//
//  inputValidation.swift
//  multiPartChallengeUIKit
//
//  Created by EthanBalink on 29/06/2023.
//

import Foundation

class InputValidation {
    static func inputIsValid(_ dynamicVariable: String, ofType: String) -> Bool {
        switch ofType {
        case "email":
           
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: dynamicVariable)
            
        case "password":
           
            let passwordRegEx = "^[^\\s]+$"
            let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
            return passwordPred.evaluate(with: dynamicVariable)
            
        case "name":
           
            return !dynamicVariable.isEmpty
            
        default:
            return false
        }
    }

}
