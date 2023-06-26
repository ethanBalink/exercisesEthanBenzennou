//
//  View Model.swift
//  blog post app
//
//  Created by EthanBalink on 26/06/2023.
//

import Foundation

class ViewModel {
    var postsArr :[Post] = []
    func getPostsArrDataFromServices(_ completion: @escaping (_ success: Bool, _ errorMessage: String?) -> Void) {
        PostGetter.shared.getPostData
        { success, error in
            if success {
                self.postsArr = PostGetter.shared.getPosts()
                print(self.postsArr)
                completion(true,"succes")
                // reloadData
                
            } else if error != nil {
                print(error ?? "")
                completion(false,"no data ")
            }
            else {
                print("mistake")
                completion(false,"internal error")
            }
        }
        
        
    }    //static let shared = viewModel()
    // get count when theres array
    func getTableCount()  -> Int {
        
        return postsArr.count
        
    }
    func getPostForCell(_ currentCell: Int)->Post {
        return postsArr[currentCell]
        
        
    }
    
    
}


