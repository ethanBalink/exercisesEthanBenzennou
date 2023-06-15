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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ListViewController {
            vc.username = usernameInput?.text ?? ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^[^\\s]+$"
        
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    func inputFieldsValid() -> Bool{
        if (usernameInput.text != "") && (passwordInput.text != "") {
            if isValidEmail(usernameInput.text!) &&
                isValidPassword(passwordInput.text!) {
                
                return true
            }
            
        }
        return false
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if  inputFieldsValid() {
            performSegue(withIdentifier: "listview", sender: nil)
        }
    }
}

