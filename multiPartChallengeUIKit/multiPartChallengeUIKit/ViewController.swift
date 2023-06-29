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
        myVM.loginButtonAction(fname: firstnameInput.text!, lname: lastnameInput.text!, username: usernameInput.text!, pwd: passwordInput.text!) { success in
            if success {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "listview", sender: nil)
                }
            }
            else {
                print("unable to complete registation for some reason")
            }
        }
    }
    
    
    //
   
}// vc

