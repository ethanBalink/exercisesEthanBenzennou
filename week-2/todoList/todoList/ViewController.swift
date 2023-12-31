//
//  ViewController.swift
//  todoList
//
//  Created by EthanBalink on 18/06/2023.
//

import UIKit
import CoreData
class ViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collView: UICollectionView!
    var context: NSManagedObjectContext!
    var entity: NSEntityDescription!
    var todoArr: [NSManagedObject] = [] {
        didSet {
            self.collView.reloadData()
        }
    }
    var alert: CustomView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "Todo", in: context)
        getSavedData() // adds saved todos to array if present
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.item
        showCustomView(currentObj: todoArr[indexPath.item])
        
    }
    // func when add item
    func addTodo(title:String) {
        let newTodo = NSManagedObject(entity: entity!, insertInto: context)
        newTodo.setValue(title, forKey: "title")
        do {
            try context.save() //saving data to core data
            todoArr.append(newTodo) // adding to local array
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    // validation
    func isValidInput(_ input: String) -> Bool {
        let inputRegEx = "^[^\\s]+$"
        let inputPred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputPred.evaluate(with: input)
    }
    // default data
    func getSavedData() {
        let request = NSFetchRequest<NSManagedObject>(entityName: "Todo")
        do {
            todoArr = try context.fetch(request) // get saved data and assign to todoArr if present
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
                if self.isValidInput(userInput) {
                    self.addTodo(title: userInput)
                }}
            
        })
        // adds button
        dialogMessage.addAction(ok)
        // adds alert to screen
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    var index: Int?
    func showCustomView(currentObj:NSManagedObject) {
        
        alert = CustomView(frame: CGRect(x: 20.0, y: 100.0, width: 300.0, height: 250.0))
        let a = currentObj.value(forKey: "title") as? String
        alert?.title.text = a
        alert?.layer.borderWidth = 5
        alert?.layer.borderColor = UIColor.red.cgColor
        alert?.switchStatus.isOn = currentObj.value(forKey: "isDone") as? Bool ?? false
        
        alert?.xbutton.addTarget(self, action: #selector(removeView), for: .touchUpInside)
        
        self.view.addSubview(alert!)
    }
    
    @objc  func removeView(){
        print(alert?.switchStatus.isOn ?? true)
        //1
        let currentObject = todoArr[index!]
        if let statusSwitch = alert?.switchStatus.isOn {
            currentObject.setValue(statusSwitch, forKey: "isDone")
        } else {
            print("error")
        }
        getSavedData()
        alert?.removeFromSuperview()
    }
    
    
}
