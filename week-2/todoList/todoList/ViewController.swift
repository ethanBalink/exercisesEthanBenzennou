//
//  ViewController.swift
//  todoList
//
//  Created by EthanBalink on 18/06/2023.
//

import UIKit
import CoreData
class ViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // new code
    // old code
    let USER_DEFAULT_KEY = "titleArr"
    // NSManagedObject
    var todoArr: [NSManagedObject] = [] {
        didSet {
            // print(todoArr)
            self.collView.reloadData()
        }
    }
    @IBOutlet weak var collView: UICollectionView!
    // save data in userdefaults
    let defaults = UserDefaults.standard
    var context: NSManagedObjectContext!
    var entity: NSEntityDescription!
    override func viewDidLoad() {
        super.viewDidLoad()
        //old code
        //        if var memoryArray = UserDefaults.standard.array(forKey: USER_DEFAULT_KEY) as? [String] {
        //            todoArr = memoryArray
        //        } else {
        //            todoArr = ["eat breakfast", "learn"]
        //        }
        // new code
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "Todo", in: context)
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
        let currentTodo = todoArr[indexPath.item]
        cell.label.text = currentTodo.value(forKey: "title" ) as? String
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
        // todoArr.append(task)
        // old code
        // UserDefaults.standard.setValue(todoArr, forKey: USER_DEFAULT_KEY)
        //new code
        let newTodo = NSManagedObject(entity: entity!, insertInto: context)
        newTodo.setValue(task, forKey: "title")
        todoArr.append(newTodo)
        
    }
    
    // validation
    func isValidInput(_ input: String) -> Bool {
        let inputRegEx = "^[^\\s]+$"
        let inputPred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputPred.evaluate(with: input)
    }
    // new code
    func getData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "title") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
    }
    //
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        // defines alert
        let dialogMessage = UIAlertController(title: "Add Task", message: "Write the task you need to do", preferredStyle: .alert)
        // adds input field
        dialogMessage.addTextField(configurationHandler: { textField in})
        // adds button and action
        let ok = UIAlertAction(title: "Add", style: .default, handler: { (action) -> Void in
            if let userInput = dialogMessage.textFields?.first?.text {
                //  print(userInput)
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
