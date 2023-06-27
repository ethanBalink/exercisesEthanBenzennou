//
//  View Model.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var postsArr :[Post] = []
    
    
    func getPostsArrDataFromServices() {
        if postsArr.count == 0 {
            PostGetter.shared.getPostData
            { success, data, error in
                if success {
                    
                    if let postsArray = data {
                        DispatchQueue.main.async {
                            self.postsArr = postsArray
                        }
                        print("got data and saved to array in viewModel")
                    }
                    
                    
                } else if error != nil {
                    print(error ?? "")
                }
                else {
                    print("mistake")
                }
            }
            
            
        }
    }
    
}


