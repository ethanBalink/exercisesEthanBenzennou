//
//  ViewController.swift
//  multiPartChallengeUIKit
//
//  Created by EthanBalink on 28/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstnameInput: UITextField!
    @IBOutlet weak var lastnameInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    let myVM = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ListViewController {
            vc.username = usernameInput?.text ?? ""
            vc.productArr = myVM.viewCtrProductArr ?? []
        }
    }
    
    @IBAction func loginPressed() {
        loginButtonAction()
    }
    
    func inputFieldsValid() -> Bool {
        guard let username = usernameInput?.text, let password = passwordInput?.text, let _ = firstnameInput?.text, let _ = lastnameInput?.text
        else {
            return false
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let passwordRegEx = "^[^\\s]+$"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        return !username.isEmpty && !password.isEmpty && emailPred.evaluate(with: username) && passwordPred.evaluate(with: password)
    }
    //
    func loginButtonAction() {
        if inputFieldsValid() {
            let fName = firstnameInput.text!, lName = lastnameInput.text!, username = usernameInput.text!, pwd = passwordInput.text!
            myVM.register(fname: fName, lname: lName, username: username, pwd: pwd){ success in
                if success {
                    self.myVM.fetchProducts { success in
                        if success {
                            print(self.myVM.viewCtrProductArr!)
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "listview", sender: nil)
                            }
                        }// if success fetchProducts
                    } // closure fetchProducts
                }// if success register
            }// closure register
        }// input validation's if
    }// func
}// vc
