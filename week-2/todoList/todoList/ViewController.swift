//
//  ViewController.swift
//  todoList
//
//  Created by EthanBalink on 18/06/2023.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let USER_DEFAULT_KEY = "titleArr"
    
    var todoArr: [String] = [] {
        didSet {
            print(todoArr)
            self.collView.reloadData()
        }
    }
    @IBOutlet weak var collView: UICollectionView!
    // save data in userdefaults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if var memoryArray = UserDefaults.standard.array(forKey: USER_DEFAULT_KEY) as? [String] {
            todoArr = memoryArray
        } else {
            todoArr = ["eat breakfast", "learn"]
        }
    }
    // row size return
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = todoArr.count
        return count
    }
    
    // cell showing
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewCell", for: indexPath) as! CellCollectionViewCell
        cell.backgroundColor = UIColor.cyan
        let  text = todoArr[indexPath.item]
        cell.label.text = text
        return cell
    }
    
    // spacing settings
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenItems = flowLayout.minimumInteritemSpacing
        let newWidth = collectionViewWidth - (spaceBetweenItems * 1 )
        return CGSize(width: newWidth / 2,
                      height: 100)
    }
    
    // func when add item
    func addTask(task:String) {
        todoArr.append(task)
        UserDefaults.standard.setValue(todoArr, forKey: USER_DEFAULT_KEY)
    }
    
    // validation
    func isValidInput(_ input: String) -> Bool {
        let inputRegEx = "^[^\\s]+$"
        let inputPred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputPred.evaluate(with: input)
    }
    
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        // defines alert
        let dialogMessage = UIAlertController(title: "Add Task", message: "Write the task you need to do", preferredStyle: .alert)
        // adds input field
        dialogMessage.addTextField(configurationHandler: { textField in})
        // adds button and action
        let ok = UIAlertAction(title: "Add", style: .default, handler: { (action) -> Void in
            if let userInput = dialogMessage.textFields?.first?.text {
                print(userInput)
                if self.isValidInput(userInput) {
                    self.addTask(task: userInput)
                }}
            
        })
        // adds button
        dialogMessage.addAction(ok)
        // adds alert to screen
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    
}
