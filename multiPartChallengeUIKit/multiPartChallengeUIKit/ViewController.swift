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
    var token: String = ""
    let myVM = ViewModel()
  
    // to show username in text page navbar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? ListViewController {
//            vc.username = usernameInput?.text ?? ""
//            vc.productArr = viewCtrProductArr
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginPressed() {
        loginButtonAction()
    }
    //    func isValidEmail(_ email: String) -> Bool {
    //        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    //
    //        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    //        return emailPred.evaluate(with: email)
    //    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^[^\\s]+$"
        
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    func inputFieldsValid() -> Bool {
        if (usernameInput.text != "") && (passwordInput.text != "") {
            if isValidPassword(passwordInput.text!) {
                
                return true
            }
            
        }
        return false
    }
//    func register(fname: String, lname: String, username: String, pwd: String, completion: @escaping () -> Void) {
//        let url = URL(string: "https://balink.onlink.dev/register")!
//        let userCred: [String: Any] = [
//            "firstname": fname,
//            "lastname": lname,
//            "username": username,
//            "password": pwd
//        ]
//
//        let convertedToJson = try? JSONSerialization.data(withJSONObject: userCred)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = convertedToJson
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                self.token = String(data: data, encoding: .utf8) ?? ""
//                completion() // Call the completion handler after obtaining the token
//            } else {
//                print("There was an error")
//            }
//        }.resume()
//    }
    
//    func fetchProductsFromAPI(completion: @escaping ([Product]) -> Void) {
//        let url = URL(string: "https://balink.onlink.dev/products")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            do {
//                if let data = data {
//                    let decoded = try JSONDecoder().decode([Product].self, from: data)
//                    completion(decoded) // Call the completion handler with the fetched products
//                }
//            } catch {
//                print("There was an error")
//            }
//        }.resume()
//    }
    func loginButtonAction() {
        if inputFieldsValid(),
           let fname = firstnameInput?.text,
           let lname = lastnameInput?.text,
           let username = usernameInput?.text,
           let pwd = passwordInput?.text {
            myVM.register(fname: fname, lname: lname, username: username, pwd: pwd){success in
                if success {
                    self.myVM.fetchProducts { success in
                        if success {
                            print(self.myVM.viewCtrProductArr!)
                        }
                    }
                    // second function to get array data
                }
//                self.fetchProductsFromAPI { products in
//                    self.viewCtrProductArr = products
//                    DispatchQueue.main.async {
//                        self.performSegue(withIdentifier: "listview", sender: nil)
//                    }
               // }
            }
        }
    }// func
}// vc
