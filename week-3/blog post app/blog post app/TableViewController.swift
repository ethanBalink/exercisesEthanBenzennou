//
//  TableViewController.swift
//  blog post app
//
//  Created by EthanBalink on 25/06/2023.
//

import UIKit

class TableViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate {
    
    
    let myViewModel = ViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // get data in view model
        myViewModel.getPostsArrDataFromServices() { success, error in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            else {
            
                print("mistake")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myViewModel.getTableCount()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let currentCellVM = myViewModel.getCellViewModel(at: indexPath.item)
        cell.textLabel?.text = "\(currentCellVM.getCellTitle())"// only title
        //cell.textLabel?.text = "\("currentObj.title")"
        
        return cell
    }
    
}
