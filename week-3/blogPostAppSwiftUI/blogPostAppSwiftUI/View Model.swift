//
//  View Model.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//

import Foundation

class ViewModel {
    var postsArr :[Post] = []
    func getPostsArrDataFromServices(_ completion: @escaping (_ success: Bool, _ errorMessage: String?) -> Void) {
        PostGetter.shared.getPostData
        { success, data, error in
            if success {
                if let postsArray = data {
                    self.postsArr = postsArray
                    print(self.postsArr)
                    completion(true,"succes")
                }
               
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
   func getCellViewModel(at i: Int) -> CellViewModel {
       let cellVM = CellViewModel(post: postsArr[i])
        return cellVM
    }

    
}


