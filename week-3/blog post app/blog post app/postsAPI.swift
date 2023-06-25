//
//  API.swift
//  blog post app
//
//  Created by EthanBalink on 25/06/2023.
//

import Foundation
class postGetter {
    var postArr: [Post] = []
    static var shared = postGetter()
   func getData(_ completion: @escaping (_ success: Bool) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        URLSession.shared.dataTask(with: url){(data,response,error) in
            
            do
            {
                let posts = try JSONDecoder().decode([Post].self, from: data!) // usally not allowed
                self.postArr = posts
                completion(true)
            }
            catch
            {
                print("there was an error")
                completion(false)
            }
        }.resume()
    }
    func getPosts() -> [Post] {
        return postArr
    }
}
