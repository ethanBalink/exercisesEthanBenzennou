//
//  SecondViewController.swift
//  multiPartChallengeUIKit
//
//  Created by EthanBalink on 28/06/2023.
//

import Foundation
import UIKit

class SecondViewContollerViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
    
    var username:String = "Abraham"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome " + username// needs to be found
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var table: UITableView!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
