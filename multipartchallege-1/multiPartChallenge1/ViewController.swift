//
//  ViewController.swift
//  multiPartChallenge1
//
//  Created by EthanBalink on 15/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func inputFieldsValid() -> Bool{
        if (usernameInput.text != nil) && (passwordInput.text != nil) {
            if isValidEmail(usernameInput.text!){
                return true
            }
            
        }
        return false
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        //        print(usernameInput.text ?? "")
        //        print(passwordInput.text ?? "")
        if  inputFieldsValid() {
            performSegue(withIdentifier: "secondView", sender: nil)
        }
    }
}

