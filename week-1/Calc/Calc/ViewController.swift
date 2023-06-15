//
//  ViewController.swift
//  Calc
//
//  Created by EthanBalink on 13/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func calculation(exp: String) {
        
    }
    
    @IBOutlet weak var expression: UILabel!
    
    
    func addChar(ch:String){
        var newExpration = ""
        if let oldExpration = expression.text {
            newExpration = oldExpration + ch
        }
        expression.text = newExpration
    }
    
    //    button input functions
    @IBAction func pressedComma(_ sender: Any) {
      addChar(ch: ".")
       // expression.text! += "444"
        
    }
    @IBAction func pressedPlus(_ sender: Any) {
        addChar(ch: "+")
    }
    
  
    @IBAction func pressedMinus(_ sender: Any) {
        addChar(ch: "-")
    }
    
    
    @IBAction func pressedDivide(_ sender: Any) {
        addChar(ch: "/")
    }
    
    @IBAction func pressedMultiple(_ sender: Any) {
        addChar(ch: "*")
    }
    @IBAction func pressedZero(_ sender: Any) {
        addChar(ch: "0")
    }
    
    @IBAction func pressedOne(_ sender: Any) {
        addChar(ch: "1")
    }
    @IBAction func pressedTwo(_ sender: Any) {
        addChar(ch: "2")
    }
    @IBAction func pressedThree(_ sender: Any) {
        addChar(ch: "3")
    }
    @IBAction func pressedFour(_ sender: Any) {
        addChar(ch: "4")
    }
    @IBAction func pressedFive(_ sender: Any) {
        addChar(ch: "5")
    }
    @IBAction func pressedSix(_ sender: Any) {
        addChar(ch: "6")
    }
    @IBAction func pressedSeven(_ sender: Any) {
        addChar(ch: "7")
    }
    @IBAction func pressedEight(_ sender: Any) {
        addChar(ch: "8")
    }
    @IBAction func pressedNine(_ sender: Any) {
        addChar(ch: "9")
    }
}

