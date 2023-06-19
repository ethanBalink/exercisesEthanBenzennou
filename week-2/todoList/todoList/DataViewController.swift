//
//  DataViewController.swift
//  todoList
//
//  Created by EthanBalink on 19/06/2023.
//

import UIKit

class DataViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }
    var postsArr = [Post] = []
    fileprivate func getData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        // network call
        URLSession.shared.dataTask(with: url){(data,response,error) in
            
            do
            {
                let posts = try JSONDecoder().decode([Post], from: data!)// usally not allowed
                postsArr = posts
                
            }
            catch
            {
                print("there was an error")
            }
        }.resume()
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
struct Post: Codable {
    let id:Int
    let title: String
    let body: String
}
