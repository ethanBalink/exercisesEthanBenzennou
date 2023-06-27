//
//  CommentsAPI.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//

import Foundation
class CommentsGetter {
    static var shared = CommentsGetter()
    func getCommentsFor(id:Int,_ completion: @escaping (_ success: Bool, _ data:[Comment]?,  _ errorMessage:String?) -> Void)  {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(id)")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(false, nil,"Network error: \(error.localizedDescription)")
                return
            }
            
            guard let responseData = data else {
                completion(false, nil, "No data received")
                return
            }
            
            do {
                let commments = try JSONDecoder().decode([Comment].self, from: responseData)
                //self.postArr = posts
                completion(true, commments, nil)
            } catch {
                completion(false, nil,  "JSON decoding error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
