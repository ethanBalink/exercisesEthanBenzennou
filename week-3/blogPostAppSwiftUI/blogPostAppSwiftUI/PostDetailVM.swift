//
//  PostDetailVM.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//

import Foundation
class PostVM :ObservableObject{
    @Published var commentsArr :[Comment] = []
    
    func getCommentsFor(id:Int) {
        if commentsArr.count == 0 {
            CommentsGetter.shared.getCommentsFor(id: id){ success, data, error in
                if success {
                    
                    if let commentsArray = data {
                        DispatchQueue.main.async {
                            self.commentsArr = commentsArray
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
