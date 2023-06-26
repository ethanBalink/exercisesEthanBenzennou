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
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3// myViewModel.getTableCount()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //let currentObj = postsArr[indexPath.row]
        cell.textLabel?.text = "\("currentObj.title")"
        
        return cell
    }
    
}
