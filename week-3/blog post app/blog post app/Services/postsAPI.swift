//
//  API.swift
//  blog post app
//
//  Created by EthanBalink on 25/06/2023.
//

import Foundation
class PostGetter {
    var postArr: [Post] = []
    static var shared = PostGetter()
    func getPostData(_ completion: @escaping (_ success: Bool, _ errorMessage: String?) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(false, "Network error: \(error.localizedDescription)")
                return
            }
            
            guard let responseData = data else {
                completion(false, "No data received")
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: responseData)
                self.postArr = posts
                completion(true, nil)
            } catch {
                completion(false, "JSON decoding error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func getPosts() -> [Post] {
        return postArr
    }
}
