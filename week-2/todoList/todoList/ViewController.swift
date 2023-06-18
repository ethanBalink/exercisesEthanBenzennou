//
//  ViewController.swift
//  todoList
//
//  Created by EthanBalink on 18/06/2023.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var collView: UICollectionView!
    var arr = ["hi","hello","hey","jo","jt", "ofldx"] {
        didSet {
            print(arr)
            self.collView.reloadData()
        }
    }
    
    // row size return
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    // cell showing
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewCell", for: indexPath) as! CellCollectionViewCell
        cell.backgroundColor = UIColor.cyan
        cell.label.text = arr[indexPath.item]
        
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
    // section header
    //
    // alert..
    func isValidInput(_ input: String) -> Bool {
        let inputRegEx = "^[^\\s]+$"
        
        let inputPred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputPred.evaluate(with: input)
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        // defines alert
        let dialogMessage = UIAlertController(title: "Add Task", message: "Write the task you need to do", preferredStyle: .alert)
        // adds input
        dialogMessage.addTextField(configurationHandler: { textField in})
        // defines button
        let ok = UIAlertAction(title: "Add", style: .default, handler: { (action) -> Void in
            if let userInput = dialogMessage.textFields?.first?.text {
                print(userInput)
                if self.isValidInput(userInput){
                    self.arr.append(userInput)
                }}
            
        })
        // adds button
        dialogMessage.addAction(ok)
        // adds alert to screen
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    
}
