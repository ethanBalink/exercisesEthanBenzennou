//
//  cellViewModel.swift
//  blog post app
//
//  Created by EthanBalink on 26/06/2023.
//

import Foundation
class CellViewModel {
    init(post:Post) {
        currentPost = post
    }
    let currentPost: Post
    
    func getCellTitle() -> String {
        return currentPost.title
    }
    
    
}
