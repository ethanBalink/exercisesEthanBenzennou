//
//  ListViewController.swift
//  multiPartChallenge1
//
//  Created by EthanBalink on 15/06/2023.
//

import UIKit

class ListViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    let productArr = ["water","food", "chitas", "rambam", "macbook", "mouse", "charger"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "- \(productArr[indexPath.row]) "
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    var username :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = username
       tableView.reloadData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

       tableView.dataSource = self
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
