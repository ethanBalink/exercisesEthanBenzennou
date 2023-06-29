//
//  ViewModel.swift
//  multiPartChallengeUIKit
//
//  Created by EthanBalink on 28/06/2023.
//

import Foundation
class ViewModel {
    
    var token: String?
    var viewCtrProductArr: [Product]?
    
    func register(fname: String, lname: String, username: String, pwd: String,_ completion: @escaping (_ success: Bool) -> Void) {
        ProductsGetter.shared.registerAPI(fname: fname, lname: lname, username: username, pwd: pwd, completion: { success, data, error in
            if success {
                if let recievedToken = data {
                    self.token = recievedToken
                    //print(self.token)
                    completion(true)
                }
                
            } else if error != nil {
                print(error ?? "")
                completion(false)
            }
            else {
                print("mistake")
                completion(false)
            }
        })
    }
    
    func fetchProducts(_ completion: @escaping (_ success: Bool) -> Void) {
        if let existingToken = self.token {
            ProductsGetter.shared.fetchProductsFromAPI(token: existingToken, completion: { productArr in
                if let recievedProducts = productArr {
                    self.viewCtrProductArr = recievedProducts
                    completion(true)
                }
                else {
                    completion(false)
                }
                
                
            }// completion
            )// func args
        }// if token exists
    }// func
    
    func loginButtonAction(fname: String, lname: String, username: String, pwd: String,_ completion: @escaping (_ success: Bool) -> Void) {
        
        if (InputValidation.inputIsValid(fname, ofType: "name") && InputValidation.inputIsValid(lname, ofType: "name") && InputValidation.inputIsValid(username, ofType: "email") && InputValidation.inputIsValid(pwd, ofType: "password")) {
            register(fname: fname, lname: lname, username: username, pwd: pwd) { success in
                if success {
                    self.fetchProducts { success in
                        if success {
                            completion(true)
                        }// if success fetchProducts
                        else {
                            completion(false)
                        }
                    } // closure fetchProducts
                }// if success register
                
            }// closure register
            
        }// if validation
        else {
            print("invalid unput")
        }
    }// func
    
    
    
    
}// class
