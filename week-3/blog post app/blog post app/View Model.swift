//
//  View Model.swift
//  blog post app
//
//  Created by EthanBalink on 26/06/2023.
//

import Foundation

class ViewModel {
    var postsArr :[Post] = []
    func getPostsArrDataFromServices() {
        postGetter.shared.getData
        { success, error in
            if success {
                self.postsArr = postGetter.shared.getPosts()
                print(self.postsArr)
                // reloadData
                //                    DispatchQueue.main.async {
                //                        TabltableView.reloadData()
                //                    }
            } else if error != nil {
                print(error ?? "")
                
            }
            else {
                print("mistake")
            }
        }
        
        
    }    //static let shared = viewModel()
    // get count when theres array
    func getTableCount()  -> Int {
        
        return postsArr.count
        
    }
    func getPostForCell(_ currentCell: Int) {
        
        
        
    }
    
    
}


