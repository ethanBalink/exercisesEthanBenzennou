//
//  TableViewController.swift
//  blog post app
//
//  Created by EthanBalink on 25/06/2023.
//

import UIKit

class TableViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var postsArr :[Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        tableView.dataSource = self
        postGetter.shared.getData { succes in
            if succes {
                self.postsArr = postGetter.shared.getPosts()
                print(self.postsArr)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArr.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let currentObj = postsArr[indexPath.row]
        cell.textLabel?.text = "\(currentObj.title)"
        
        return cell
    }
    
}
