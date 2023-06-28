//
//  ListViewController.swift
//  multiPartChallengeUIKit
//
//  Created by EthanBalink on 28/06/2023.
//

import UIKit

class ListViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    var productArr : [Product] = []
    var categoriesArr :[String] = []
    func getCategories() {
        for product in productArr {
            if !categoriesArr.contains(product.category) {
                categoriesArr.append(product.category)
            }
        }
    }

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoriesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let currentObj = categoriesArr[indexPath.row]
        cell.textLabel?.text = "\(currentObj)"
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    var username :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = username
       tableView.reloadData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        getCategories()
        //tableView.reloadData()
     //  tableView.dataSource = self
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
